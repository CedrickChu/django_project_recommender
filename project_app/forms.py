# forms.py
from django import forms

from .models import Employees, Training


class ProjectRecommenderForm(forms.Form):
    project_name = forms.CharField(label='Project Name', max_length=100)
    project_description = forms.CharField(label='Project Description', widget=forms.Textarea)
    technology_stack = forms.CharField(label='Technology Stack', max_length=100)
    project_budget = forms.DecimalField(label='Project Budget', decimal_places=2, max_digits=10)
    team_size = forms.IntegerField(label='Team Size')
    project_timeline = forms.IntegerField(label='Project Timeline (in weeks)')

    required_skills = forms.CharField(label='Required Skills', max_length=255, help_text='Enter required skills separated by commas')
    


class EmployeeForm(forms.ModelForm):
    class Meta:
        model = Employees
        fields = '__all__' 
        
class TrainingForm(forms.ModelForm):
    class Meta:
        model = Training
        fields = '__all__'