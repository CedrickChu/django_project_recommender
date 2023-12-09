# models.py
from django.db import models

class Hobby(models.Model):
    name = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return self.name

class Skill(models.Model):
    skill_type = models.CharField(max_length=50, unique=True)
    skill_description = models.TextField()

    def __str__(self):
        return self.skill_type
    
class Personality(models.Model):
    code = models.CharField(max_length=10, unique=True)
    name = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return self.name
    
class Institution(models.Model):
    Institution_name = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return self.Institution_name
    
class Employees(models.Model):
    first_name = models.CharField(max_length=50)
    middle_name = models.CharField(max_length=50, null=True)
    last_name = models.CharField(max_length=50)
    hobbies = models.ManyToManyField(Hobby, through='EmployeeHobby')
    personality = models.ManyToManyField(Personality, through='EmployeePersonality')
    institution = models.ForeignKey(Institution, on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return f"{self.first_name} {self.last_name}"

class EmployeeSkills(models.Model):
    employee = models.ForeignKey('Employees', on_delete=models.CASCADE, primary_key=True)
    skill = models.ForeignKey('Skill', on_delete=models.CASCADE)
    skill_level = models.CharField(max_length=250)

    def __str__(self):
        return f"{self.employee} - {self.skill} - {self.skill_level}"

class EmployeeHobby(models.Model):
    employee = models.ForeignKey(Employees, on_delete=models.CASCADE)
    hobby = models.ForeignKey(Hobby, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.employee} - {self.hobby}"

class EmployeePersonality(models.Model):
    employee = models.ForeignKey(Employees, on_delete=models.CASCADE)
    personality = models.ForeignKey(Personality, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.employee} - {self.personality}"

class Training(models.Model):
    training_venue = models.CharField(max_length=100)
    training_type = models.CharField(max_length=50)
    start_date = models.DateField()
    end_date = models.DateField()
    training_title = models.CharField(max_length=100)
    institution = models.ForeignKey(Institution, on_delete=models.CASCADE)

    def __str__(self):
        return self.training_title

class EmployeeTraining(models.Model):
    employee = models.ForeignKey(Employees, on_delete=models.CASCADE)
    training = models.ForeignKey(Training, on_delete=models.CASCADE)
    participation_type = models.CharField(max_length=50)

    def __str__(self):
        return f"{self.employee} - {self.training} - {self.participation_type}"
