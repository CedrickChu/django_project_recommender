from django.urls import path
from .views import EmployeeListView, PersonalityView, TrainingView
from . import views

urlpatterns = [
    path('', views.employee_dashboard, name='home_view'),
    path('create_project/', views.create_project, name='project_view'),
    path('employee/', EmployeeListView.as_view(), name='employee_view'),
    path('personality/', PersonalityView.as_view(), name='personality_view'),
    path('training/', TrainingView.as_view(), name='training_view'),
    path('edit_employee/<int:employee_id>/', views.edit_employee, name='edit_employee'),
    path('delete_employee/<int:employee_id>/', views.delete_employee, name='delete_employee'),
    path('add_employee/', views.add_employee, name='add_employee'),
    path('edit_training/<int:training_id>/', views.edit_training, name='edit_training'),
    path('add_training/', views.add_training, name='add_training'),
    path('recommendation/<int:project_id>/', views.project_recommendations, name='employee_recommendation'),
    path('projects/', views.ProjectListView.as_view(), name='project-list'),
    path('projects/<int:pk>/', views.ProjectDetailView.as_view(), name='project_detail'),
    path('edit_project/<int:project_id>/', views.edit_project, name='edit_project'),
]
    