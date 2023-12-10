from project_app.models import Employees, EmployeeEducation, Institution

def run():
    try:
        for emp_education in EmployeeEducation.objects.all():
            employee_id = emp_education.employee_id
            institution_id = emp_education.institution_id

            # Check if both employee_id and institution_id are not None
            if employee_id and institution_id:
                # Retrieve the associated Employees and Institution instances
                employee = Employees.objects.get(id=employee_id)
                institution = Institution.objects.get(id=institution_id)

                # Update the employee's institution field
                employee.institution = institution
                employee.save()
                print(f"Updated Employee ID: {employee.id} with Institution ID: {institution.id}")
            else:
                print(f"Invalid Employee ID or Institution ID in EmployeeEducation entry.")

        print("Update complete.")
    except Exception as e:
        print(f"Error during update: {e}")
