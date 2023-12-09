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

@admin.register(Hobby)
class HobbyAdmin(admin.ModelAdmin):
    pass

@admin.register(Personality)
class PersonalityAdmin(admin.ModelAdmin):
    list_display = ('code', 'name')

admin.site.register(Institution)


@admin.register(Employees)
class EmployeeAdmin(admin.ModelAdmin):
    list_display = ('first_name', 'middle_name', 'last_name', 'institution')
    search_fields = ('first_name', 'last_name')

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

@admin.register(EmployeePersonality)
class EmployeePersonalityAdmin(admin.ModelAdmin):
    list_display = ('employee', 'personality')

@admin.register(EmployeeSkills)
class EmployeeSkillsAdmin(admin.ModelAdmin):
    list_display = ('employee', 'skill', 'skill_level')

@admin.register(Training)
class TrainingAdmin(admin.ModelAdmin):
    list_display = ('training_title', 'training_venue', 'start_date', 'end_date', 'institution')

@admin.register(EmployeeTraining)
class EmployeeTrainingAdmin(admin.ModelAdmin):
    list_display = ('employee', 'training', 'participation_type')
