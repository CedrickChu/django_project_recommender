from project_app.models import Employees, EmployeePersonality, Personality

def run():
    # Iterate through EmployeePersonality entries and update employee.personality
    for emp_personality in EmployeePersonality.objects.all():
        employee = emp_personality.employee
        personality = emp_personality.personality

        # Update the employee's personality field
        employee.personality = personality
        employee.save()

    print("Update complete.")