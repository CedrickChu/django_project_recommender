# views.py
from django.views.generic import TemplateView
from django.shortcuts import render
from django.core.paginator import Paginator
from django.views import View
from django.shortcuts import render, get_object_or_404, redirect
from .models import Employees, Personality, Training, Institution
from .forms import EmployeeForm, TrainingForm

class HomeView(TemplateView):
    template_name = 'base.html'

class ProjectView(TemplateView):
    template_name = 'project.html'

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
    
