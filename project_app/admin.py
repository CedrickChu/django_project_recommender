# admin.py
from django.contrib import admin
from .models import Skill, Hobby, Personality, Employee, EmployeeHobby, EmployeePersonality

@admin.register(Skill)
class SkillAdmin(admin.ModelAdmin):
    list_display = ('skill_type', 'skill_description')

@admin.register(Hobby)
class HobbyAdmin(admin.ModelAdmin):
    model = EmployeeHobby

@admin.register(Personality)
class PersonalityAdmin(admin.ModelAdmin):
    list_display = ('code', 'name')

class EmployeeHobbyInline(admin.TabularInline):
    model = EmployeeHobby

class EmployeePersonalityInline(admin.TabularInline):
    model = EmployeePersonality

@admin.register(Employee)
class EmployeeAdmin(admin.ModelAdmin):
    list_display = ('emp_id', 'first_name', 'last_name', 'start_date', 'exit_date')
    inlines = [EmployeeHobbyInline, EmployeePersonalityInline]

@admin.register(EmployeeHobby)
class EmployeeHobbyAdmin(admin.ModelAdmin):
    list_display = ('employee', 'hobby')

@admin.register(EmployeePersonality)
class EmployeePersonalityAdmin(admin.ModelAdmin):
    list_display = ('employee', 'personality')
