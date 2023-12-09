# admin.py
from django.contrib import admin
from .models import Skill, Hobby, Personality, Employees, EmployeeHobby, EmployeePersonality, EmployeeSkills

@admin.register(Skill)
class SkillAdmin(admin.ModelAdmin):
    list_display = ('skill_type', 'skill_description')

@admin.register(Hobby)
class HobbyAdmin(admin.ModelAdmin):
    pass

@admin.register(Personality)
class PersonalityAdmin(admin.ModelAdmin):
    list_display = ('code', 'name')

class EmployeeHobbyInline(admin.TabularInline):
    model = EmployeeHobby

class EmployeePersonalityInline(admin.TabularInline):
    model = EmployeePersonality
    
class EmployeeSkillsInline(admin.TabularInline):
    model = EmployeeSkills

@admin.register(Employees)
class EmployeeAdmin(admin.ModelAdmin):
    list_display = ('first_name', 'middle_name', 'last_name', 'get_personality')
    search_fields = ('first_name', 'last_name')
    inlines = [EmployeeHobbyInline, EmployeePersonalityInline, EmployeeSkillsInline]

    def get_personality(self, obj):
        if obj.personality:
            return obj.personality.name
        return None

    get_personality.short_description = 'Personality'

@admin.register(EmployeeHobby)
class EmployeeHobbyAdmin(admin.ModelAdmin):
    list_display = ('employee', 'hobby')

@admin.register(EmployeePersonality)
class EmployeePersonalityAdmin(admin.ModelAdmin):
    list_display = ('employee', 'personality')

@admin.register(EmployeeSkills)
class EmployeeSkillsAdmin(admin.ModelAdmin):
    pass  
