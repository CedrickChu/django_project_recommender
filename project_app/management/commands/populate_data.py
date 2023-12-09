# populate_data/management/commands/populate_employee_data.py
from django.core.management.base import BaseCommand
from project_app.models import Employee, Hobby, Personality, EmployeeHobby, EmployeePersonality
import random

class Command(BaseCommand):
    help = 'Populate hobbies and personality data and distribute them randomly among employees.'

    def handle(self, *args, **kwargs):
        hobbies_data = [
            {"name": "Reading"},
            {"name": "Sports"},
            {"name": "Music"},
            {"name": "Travel"},
            {"name": "Cooking"},
            {"name": "Gaming"},
            {"name": "Art"},
            {"name": "Fitness"},
        ]
        personalities_data = [
            {"code": "ISTJ", "name": "The Inspector"},
            {"code": "ISFJ", "name": "The Protector"},
            {"code": "INFJ", "name":  "The Counselor"},
            {"code": "INTJ", "name": "The Mastermind"},
            {"code": "ISTP", "name": "The Craftsman"},
            {"code": "ISFP", "name": "The Composer"},
            {"code": "INFP", "name": "The Healer"},
            {"code": "INTP", "name": "The Architect"},
            {"code": "ESTP", "name": "The Dynamo"},
            {"code": "ESFP", "name": "The Performer"},
            {"code": "ENFP", "name": "The Champion"},
            {"code": "ENTP", "name": "The Visionary"},
            {"code": "ESTJ", "name": "The Supervisor"},
            {"code": "ESFJ", "name": "The Provider"},
            {"code": "ENFJ", "name": "The Teacher"},
            {"code": "ENTJ", "name": "The Commander"},
        ]

        for hobby_data in hobbies_data:
            hobby, created = Hobby.objects.get_or_create(
                name=hobby_data["name"],
            )

        Personality.objects.bulk_create([Personality(**data) for data in personalities_data])

        employees = Employee.objects.all()

        for employee in employees:
            # Randomly select hobbies for the employee
            selected_hobbies = random.sample(Hobby.objects.all(), k=random.randint(1, len(hobbies_data)))
            EmployeeHobby.objects.bulk_create([EmployeeHobby(employee=employee, hobby=hobby) for hobby in selected_hobbies])

            # Randomly select personalities for the employee
            selected_personalities = random.sample(Personality.objects.all(), k=random.randint(1, len(personalities_data)))
            EmployeePersonality.objects.bulk_create([
                EmployeePersonality(employee=employee, personality=personality) for personality in selected_personalities
            ])

        self.stdout.write(self.style.SUCCESS('Data populated successfully.'))
