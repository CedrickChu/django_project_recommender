from django.urls import path
from .views import EmployeeListView, PersonalityView
from . import views

urlpatterns = [
    path('', views.employee_dashboard, name='home_view'),
    
    # Employee__Views
    path('employee/', EmployeeListView.as_view(), name='employee_view'),
    path('add_employee/', views.add_employee, name='add_employee'),
    path('delete_employee/<int:pk>/', views.EmployeeDeleteView.as_view(), name='delete_employee'),
    path('employee/edit/<int:employee_id>/', views.edit_employee, name='edit_employee'),
    
    # Personality__Views
    path('personality/', PersonalityView.as_view(), name='personality_view'),
    
    # Training__Views
    path('training/', views.TrainingList.as_view(), name='training_view'),
    path('delete_training/<int:pk>/', views.TrainingDeleteView.as_view(), name='delete_training'),
    path('training/edit/<int:training_id>/', views.edit_training, name='edit_training'),
    path('add_training/', views.add_training, name='add_training'),
    
    # Employee_Recommendation
    path('recommendation/<int:project_id>/', views.project_recommendations, name='employee_recommendation'),
    
    # Project__views
    path('create_project/', views.create_project, name='project_view'),
    path('projects/', views.ProjectListView.as_view(), name='project-list'),
    path('projects/<int:pk>/', views.ProjectDetailView.as_view(), name='project_detail'),
]
    
