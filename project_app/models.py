from django.db import models

class Skill(models.Model):
    skill_type = models.CharField(max_length=50, unique=True)
    skill_description = models.TextField()

    def __str__(self):
        return self.name

class Hobby(models.Model):
    name = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return self.name

class Personality(models.Model):
    code = models.CharField(max_length=10, unique=True)
    name = models.CharField(max_length=50, unique=True)

    def __str__(self):
        return self.name

class Employee(models.Model):
    emp_id = models.CharField(max_length=20, unique=True)
    first_name = models.CharField(max_length=50)
    last_name = models.CharField(max_length=50)
    start_date = models.DateField()
    exit_date = models.DateField(null=True, blank=True)
    skills = models.ManyToManyField(Skill, blank=True)
    hobbies = models.ManyToManyField(Hobby, through='EmployeeHobby')
    personalities = models.ManyToManyField(Personality, through='EmployeePersonality')

    def __str__(self):
        return f"{self.first_name} {self.last_name}"

class EmployeeHobby(models.Model):
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE)
    hobby = models.ForeignKey(Hobby, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.employee} - {self.hobby}"

class EmployeePersonality(models.Model):
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE)
    personality = models.ForeignKey(Personality, on_delete=models.CASCADE)

    def __str__(self):
        return f"{self.employee} - {self.personality}"
