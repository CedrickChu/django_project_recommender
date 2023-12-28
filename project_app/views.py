# views.py
from django.views.generic import TemplateView
from django.shortcuts import render, get_object_or_404, redirect
from .models import Employees, Personality, Training, Institution, Project, Skill, Hobby, EmployeeSkills, EmployeeSkillLevel
from django.urls import reverse_lazy
from django.views.generic.edit import DeleteView
from django.contrib import messages
from .forms import EmployeeForm, TrainingForm
from .forms import ProjectForm
from .utils import get_top_recommendations
from django.http import HttpResponseRedirect
from django.views.generic import ListView, DetailView
import matplotlib.pyplot as plt
import base64
from io import BytesIO
import json
import logging
from django.db import transaction

logger = logging.getLogger(__name__)

def employee_dashboard(request):
    personalities = Personality.objects.all()
    employee_counts = [Employees.objects.filter(personality=personality).count() for personality in personalities]

    colors = [
        'rgba(255, 99, 132, 0.7)', 'rgba(54, 162, 235, 0.7)', 
        'rgba(255, 206, 86, 0.7)', 'rgba(75, 192, 192, 0.7)', 
        'rgba(153, 102, 255, 0.7)', 'rgba(255, 159, 64, 0.7)',
        'rgba(199, 99, 132, 0.7)', 'rgba(164, 162, 235, 0.7)', 
        'rgba(205, 206, 86, 0.7)', 'rgba(175, 192, 192, 0.7)', 
        'rgba(133, 102, 255, 0.7)', 'rgba(215, 159, 64, 0.7)',
        'rgba(255, 129, 102, 0.7)', 'rgba(34, 162, 235, 0.7)', 
        'rgba(255, 216, 86, 0.7)', 'rgba(85, 192, 192, 0.7)'
    ]

    chart_data = {
        'labels': [personality.name for personality in personalities],
        'data': employee_counts,
        'backgroundColor': colors[:len(personalities)]
    }

    chart_data_json = json.dumps(chart_data)

    return render(request, 'employee_dashboard.html', {'chart_data_json': chart_data_json})

class PersonalityView(TemplateView):
    template_name = 'personality_views.html'
    context_object_name = 'personalities'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context['personalities'] = Personality.objects.all()
        return context
    
class EmployeeListView(ListView):
    template_name = 'employee_views.html'
    model = Employees
    context_object_name = 'employees'
    paginate_by = 8

class TrainingList(ListView):
    model = Training
    context_object_name = 'trainings'
    template_name = 'training_views.html'
    paginate_by = 8

def edit_employee(request, employee_id):
    employee = get_object_or_404(Employees, id=employee_id)

    if request.method == 'POST':
        form = EmployeeForm(request.POST, instance=employee)
        if form.is_valid():
            saved_employee = form.save(commit=False)
            form.save_m2m()
            saved_employee.save()

            # Clear existing skills for this employee
            EmployeeSkills.objects.filter(employee=saved_employee).delete()

            # Add new skills
            skill_ids = request.POST.getlist('required_skills[]')
            beginner_level = EmployeeSkillLevel.objects.get(level_name='Beginner')
            for skill_id in skill_ids:
                skill = Skill.objects.get(id=skill_id)
                EmployeeSkills.objects.create(employee=saved_employee, skill=skill, skill_level=beginner_level)

            messages.success(request, 'Employee edited successfully!')
            return redirect('employee_view')
    else:
        form = EmployeeForm(instance=employee)

    institutions = Institution.objects.all().order_by('Institution_name')
    personalities = Personality.objects.all().order_by('name')
    skills = Skill.objects.all().order_by('skill_type')
    
    current_skills = employee.skills.all()

    context = {
        'form': form,
        'employee': employee,
        'institutions': institutions,
        'personalities': personalities,
        'skills': skills,
        'current_skills': current_skills, 
    }

    return render(request, 'edit_employee.html', context)

def add_employee(request):
    if request.method == 'POST':
        form = EmployeeForm(request.POST)
        if form.is_valid():
            employee = form.save(commit=False)
            employee.save()

            skill_ids = request.POST.getlist('required_skills[]')
            beginner_level = EmployeeSkillLevel.objects.get(level_name='Beginner')

            for skill_id in skill_ids:
                skill = Skill.objects.get(id=skill_id)
                EmployeeSkills.objects.create(employee=employee, skill=skill, skill_level=beginner_level)

            messages.success(request, 'Employee added successfully!')
            return redirect('employee_view')
        else:
            logger.warning(f"Form is not valid: {form.errors}")
    else:
        form = EmployeeForm()

    institutions = Institution.objects.all().order_by('Institution_name')
    personalities = Personality.objects.all().order_by('name')
    skills = Skill.objects.all().order_by('skill_type')

    return render(request, 'add_employee.html', {'form': form, 'institutions': institutions, 'personalities': personalities, 'skills': skills})

def edit_training(request, training_id):
    training = get_object_or_404(Training, id=training_id)
    if request.method == 'POST':
        form = TrainingForm(request.POST, instance=training)
        if form.is_valid():
            form.save()
            messages.success(request, 'Training edited successfully!')
            return redirect('training_view')
    else:
        form = TrainingForm(instance=training)
        
    institutions = Institution.objects.all()

    return render(request, 'edit_training.html', {'form': form, 'training': training, 'institutions': institutions,})

def add_training(request):
    if request.method == 'POST':
        form = TrainingForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, 'Training added successfully!')
            return redirect('training_view')
    else:
        form = TrainingForm()

    institutions = Institution.objects.all()

    return render(request, 'add_training.html', {'form': form, 'institutions': institutions})

class EmployeeDeleteView(DeleteView):
    model = Employees
    template_name = 'delete_employee.html'
    context_object_name = 'employee'
    success_url = reverse_lazy('employee_view')

    def delete(self, request, *args, **kwargs):
        response = super().delete(request, *args, **kwargs)
        messages.success(self.request, 'Employee deleted successfully!')
        return response
    
class TrainingDeleteView(DeleteView):
    model = Training
    template_name = 'delete_training.html'
    context_object_name = 'training'
    success_url = reverse_lazy('training_view')

    def delete(self, request, *args, **kwargs):
        response = super().delete(request, *args, **kwargs)
        messages.success(self.request, 'Training deleted successfully!')
        return response
    
def create_project(request):
    if request.method == 'POST':
        project_name = request.POST.get('project_name')
        project_description = request.POST.get('project_description')
        start_date = request.POST.get('start_date')
        end_date = request.POST.get('end_date')
        
        project = Project.objects.create(
            title=project_name,
            description=project_description,
            start_date=start_date,
            end_date=end_date,
        )

        selected_skill_ids = request.POST.getlist('required_skills')
        for skill_id in selected_skill_ids:
            skill = Skill.objects.get(id=skill_id)
            project.required_skills.add(skill)

        selected_personality_ids = request.POST.getlist('preferred_personality')
        for personality_id in selected_personality_ids:
            personality = Personality.objects.get(id=personality_id)
            project.preferred_personalities.add(personality)

        selected_hobby_ids = request.POST.getlist('relevant_hobbies')
        for hobby_id in selected_hobby_ids:
            hobby = Hobby.objects.get(id=hobby_id)
            project.preferred_hobbies.add(hobby)

        return HttpResponseRedirect(f'/recommendation/{project.id}/')
    
    skills = Skill.objects.all().order_by('skill_type')
    personalities = Personality.objects.all().order_by('name')
    hobbies = Hobby.objects.all().order_by('name')

    return render(request, 'create_project.html', {
        'skills': skills,
        'personalities': personalities,
        'hobbies': hobbies,
    })
    

def project_recommendations(request, project_id):
    project = Project.objects.get(id=project_id)
    employees = Employees.objects.all()  
    recommendations = get_top_recommendations(project, employees)

    employee_names = [recommendation['employee'].last_name for recommendation in recommendations]
    total_scores = [recommendation['total_score'] for recommendation in recommendations]

    plt.figure(figsize=(15, 15))
    plt.bar(employee_names, total_scores)
    plt.title('Employee Recommendation Scores')
    plt.xlabel('Employees')
    plt.ylabel('Scores')

    plt.xticks(rotation=-90)

    buffer = BytesIO()
    plt.savefig(buffer, format='png')
    buffer.seek(0)

    image_png = buffer.getvalue()
    buffer.close()
    graphic = base64.b64encode(image_png)
    graphic = graphic.decode('utf-8')

    return render(request, 'project_recommendations.html', {
        'project': project,
        'recommendations': recommendations,
        'graphic': graphic
    })
    
class ProjectListView(ListView):
    model = Project
    template_name = 'project_list.html'
    context_object_name = 'projects'


class ProjectDetailView(DetailView):
    model = Project
    template_name = 'project_detail.html'
    context_object_name = 'project'
    
