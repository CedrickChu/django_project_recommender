from django.db.models import Q
from collections import defaultdict
from .models import Employees, EmployeePersonality, EmployeeHobby

class ProjectEmployeeMatcher:
    @staticmethod
    def get_common_attributes(employees, model, attribute):
        attribute_sets = [set(model.objects.filter(employee=employee).values_list(attribute, flat=True)) for employee in employees]
        common_attributes = set.intersection(*attribute_sets) if attribute_sets else set()
        return common_attributes

    @staticmethod
    def recommend_employees_for_project(project):
        required_skills = set(project.required_skills.values_list('id', flat=True))
        employee_scores = defaultdict(int)

        for employee in Employees.objects.all():
            employee_skills = set(employee.skills.values_list('id', flat=True))
            score = len(required_skills.intersection(employee_skills))
            employee_scores[employee] = score

        sorted_employees = sorted(employee_scores.items(), key=lambda x: x[1], reverse=True)[:15]
        top_3_employees = [employee for employee, _ in sorted_employees]

        common_hobbies = ProjectEmployeeMatcher.get_common_attributes(top_3_employees, EmployeeHobby, 'hobby_id')
        common_personalities = ProjectEmployeeMatcher.get_common_attributes(top_3_employees, EmployeePersonality, 'personality_id')

        # Step 3: Filter next set of employees based on common hobbies and personalities
        next_employees_query = Q()
        for hobby_id in common_hobbies:
            next_employees_query |= Q(employeehobby__hobby_id=hobby_id)
        for personality_id in common_personalities:
            next_employees_query |= Q(employeepersonality__personality_id=personality_id)

        next_best_employees = Employees.objects.filter(next_employees_query).exclude(id__in=[e.id for e in top_3_employees]).distinct()[:5]

        # Step 4: Combine top 3 with next best 12 employees
        final_recommendations = top_3_employees + list(next_best_employees)

        return final_recommendations
