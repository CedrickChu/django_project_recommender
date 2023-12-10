# admin.py
from django.contrib import admin
from .models import (
    Skill, Hobby, Personality, Employees, EmployeeHobby,
    EmployeePersonality, EmployeeSkills, Institution,
    Training, EmployeeTraining
)

@admin.register(Skill)
class SkillAdmin(admin.ModelAdmin):
    list_display = ('skill_type', 'skill_description')
    search_fields = ('skill_type', 'skill_description')

@admin.register(Hobby)
class HobbyAdmin(admin.ModelAdmin):
    search_fields = ('name',)

@admin.register(Personality)
class PersonalityAdmin(admin.ModelAdmin):
    list_display = ('code', 'name')
    search_fields = ('code', 'name')

@admin.register(Institution)
class InstitutionAdmin(admin.ModelAdmin):
    list_display = ('Institution_name',)
    search_fields = ('Institution_name',)

@admin.register(Employees)
class EmployeeAdmin(admin.ModelAdmin):
    list_display = ('first_name', 'middle_name', 'last_name', 'institution', 'personality')
    search_fields = ('first_name', 'middle_name', 'last_name', 'institution__Institution_name')

class EmployeeHobbyInline(admin.TabularInline):
    model = EmployeeHobby

class EmployeePersonalityInline(admin.TabularInline):
    model = EmployeePersonality

class EmployeeSkillsInline(admin.TabularInline):
    model = EmployeeSkills

class EmployeeTrainingInline(admin.TabularInline):
    model = EmployeeTraining

@admin.register(EmployeeHobby)
class EmployeeHobbyAdmin(admin.ModelAdmin):
    list_display = ('employee', 'hobby')
    search_fields = ('employee__first_name', 'employee__last_name', 'hobby__name')
    
@admin.register(EmployeePersonality)
class EmployeePersonalityAdmin(admin.ModelAdmin):
    list_display = ('employee', 'personality')
    search_fields = ('employee__first_name', 'employee__last_name', 'personality__name')

@admin.register(EmployeeSkills)
class EmployeeSkillsAdmin(admin.ModelAdmin):
    list_display = ('employee', 'skill', 'skill_level')
    search_fields = ('employee__first_name', 'employee__last_name', 'skill__skill_type')

@admin.register(Training)
class TrainingAdmin(admin.ModelAdmin):
    list_display = ('training_title', 'training_venue', 'start_date', 'end_date', 'institution')
    search_fields = ('training_title', 'training_venue', 'institution__Institution_name')

@admin.register(EmployeeTraining)
class EmployeeTrainingAdmin(admin.ModelAdmin):
    list_display = ('employee', 'training', 'participation_type')
    search_fields = ('employee__first_name', 'employee__last_name', 'training__training_title')
