# views.py
from django.views.generic import TemplateView
from django.shortcuts import render
from django.core.paginator import Paginator
from django.views import View
from django.shortcuts import render, get_object_or_404, redirect
from .models import Employees, Personality, Training, Institution, Project, Skill, Hobby
from .forms import EmployeeForm, TrainingForm
from .forms import ProjectForm
from .utils import get_top_recommendations, calculate_score
from django.http import HttpResponseRedirect
from django.views.generic import ListView, DetailView
import matplotlib.pyplot as plt
import base64
from io import BytesIO
import json

def employee_dashboard(request):
    personalities = Personality.objects.all()
    employee_counts = [Employees.objects.filter(personality=personality).count() for personality in personalities]

    # Define colors for the chart
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
    
    

class EmployeeListView(View):
    template_name = 'employee_views.html'
    model = Employees
    context_object_name = 'employees'
    paginate_by = 10

    def get(self, request, *args, **kwargs):
        all_employees = self.model.objects.all()
        paginator = Paginator(all_employees, self.paginate_by)
        page = request.GET.get('page')
        employees = paginator.get_page(page)

        context = {'employees': employees, 'currentpage': int(page) if page else 1, 'totalPages': paginator.num_pages}
        return render(request, self.template_name, context)
    

class TrainingView(TemplateView):
    template_name = 'training_views.html'
    context_object_name = 'trainings'
    paginate_by = 10  
    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        all_trainings = Training.objects.all()
        paginator = Paginator(all_trainings, self.paginate_by)
        page = self.request.GET.get('page')
        trainings = paginator.get_page(page)
        context['trainings'] = trainings
        context['currentpage'] = int(page) if page else 1
        context['totalPages'] = paginator.num_pages
        return context


def edit_employee(request, employee_id):
    employee = get_object_or_404(Employees, id=employee_id)

    if request.method == 'POST':
        form = EmployeeForm(request.POST, instance=employee)
        if form.is_valid():
            form.save()
            return redirect('employee_list')
    else:
        form = EmployeeForm(instance=employee)

    institutions = Institution.objects.all()  
    personalities = Personality.objects.all()  

    return render(request, 'edit_employee.html', {'form': form, 'employee': employee, 'institutions': institutions, 'personalities': personalities})

def add_employee(request):
    if request.method == 'POST':
        form = EmployeeForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('employee_list')
    else:
        form = EmployeeForm()

    institutions = Institution.objects.all()
    personalities = Personality.objects.all()

    return render(request, 'add_employee.html', {'form': form, 'institutions': institutions, 'personalities': personalities})

def edit_training(request, training_id):
    training = get_object_or_404(Training, id=training_id)

    if request.method == 'POST':
        form = TrainingForm(request.POST, instance=training)
        if form.is_valid():
            form.save()
            return redirect('training_list')
    else:
        form = TrainingForm(instance=training)
        
    institutions = Institution.objects.all()

    return render(request, 'edit_training.html', {'form': form, 'training': training, 'institutions': institutions,})

def add_training(request):
    if request.method == 'POST':
        form = TrainingForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('training_list')
    else:
        form = TrainingForm()

    institutions = Institution.objects.all()

    return render(request, 'add_training.html', {'form': form, 'institutions': institutions})

def delete_employee(request, employee_id):
    employee = get_object_or_404(Employees, id=employee_id)
    return render(request, 'delete_employee.html', {'employee': employee})
    
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

    return render(request, 'create_project.html', {
        'skills': Skill.objects.all(),
        'personalities': Personality.objects.all(),
        'hobbies': Hobby.objects.all(),
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

    # Rotate the x-axis labels vertically
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
    
def edit_project(request, project_id):
    project = get_object_or_404(Project, pk=project_id)
    if request.method == "POST":
        form = ProjectForm(request.POST, instance=project)
        if form.is_valid():
            form.save()
            return redirect('project_list')  # Redirect after POST
    else:
        form = ProjectForm(instance=project)
    return render(request, 'edit_project.html', {'form': form})