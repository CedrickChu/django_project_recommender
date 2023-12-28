# forms.py
from django import forms

from .models import Employees, Training, Project, Skill, Hobby, Personality, EmployeeHobby
from django.contrib.admin.widgets import FilteredSelectMultiple
from django import forms

class ProjectForm(forms.Form):
    class Meta:
        model = Project
        fields = '__all__'

class TrainingForm(forms.ModelForm):
    class Meta:
        model = Training
        fields = ['training_title', 'training_venue', 'training_type', 'start_date', 'end_date', 'institution']


class EmployeeForm(forms.ModelForm):
    class Meta:
        model = Employees
        fields = ['first_name','middle_name', 'last_name', 'institution', 'personality'] 
        
class ProjectForm(forms.ModelForm):
    class Meta:
        model = Project
        fields = '__all__'

    def __init__(self, *args, **kwargs):
        super(ProjectForm, self).__init__(*args, **kwargs)

        self.fields['required_skills'].queryset = Skill.objects.all()
        self.fields['preferred_personalities'].queryset = Personality.objects.all()
        self.fields['relevant_hobbies'].queryset = Hobby.objects.all()
        
