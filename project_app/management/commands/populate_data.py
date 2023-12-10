# populate_data/management/commands/populate_employee_data.py
from django.core.management.base import BaseCommand
from project_app.models import Employees, Hobby, Personality, EmployeeHobby, EmployeePersonality
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

        for personality_data in personalities_data:
            personality, created = Personality.objects.get_or_create(
                code=personality_data["code"],
                defaults={"name": personality_data["name"]}
            )

        employees = Employees.objects.all()

        for employee in employees:
            # Randomly select hobbies for the employee
            selected_hobbies = random.sample(list(Hobby.objects.all()), k=random.randint(1, len(hobbies_data)))
            employee.hobbies.set(selected_hobbies)

            # Randomly select ONE personality for the employee using random.choice
            selected_personality = random.choice(list(Personality.objects.all()))
            employee.personalities.set([selected_personality])

        self.stdout.write(self.style.SUCCESS('Data populated successfully.'))
