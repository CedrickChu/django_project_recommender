from lightfm import LightFM
from lightfm.data import Dataset
from lightfm.cross_validation import random_train_test_split
from lightfm.evaluation import precision_at_k

from project_app.models import (
    EmployeeSkills,
    EmployeeHobby,
    EmployeePersonality,
    EmployeeTraining,
    Skill,
    Hobby,
    Personality,
    Training,
)

def get_team_recommendations():
    # Create a dataset
    dataset = Dataset()
    dataset.fit(users=EmployeeSkills.objects.values_list('employee_id', flat=True),
                items=Skill.objects.values_list('id', flat=True))

    # Build an interaction matrix
    interactions, weights = dataset.build_interactions((record['employee_id'], record['skill_id'], 1)
                                                       for record in EmployeeSkills.objects.values('employee_id', 'skill_id'))

    # Create and train the model
    model = LightFM(loss='warp')
    model.fit(interactions, epochs=30)

    # Evaluate the model (optional)
    train, test = random_train_test_split(interactions)
    precision = precision_at_k(model, test, k=5).mean()
    print(f'Precision: {precision}')
    
    team_recommendations = {}
    employee_ids = set(EmployeeSkills.objects.values_list('employee_id', flat=True))

    for employee_id in employee_ids:
        # Get a list of all items not rated by the user
        known_positives = [item_id for item_id, _ in dataset.ur[employee_id]]
        all_items = dataset.all_items()
        unknown_items = set(all_items) - set(known_positives)

        # Predict scores for unrated items
        scores = model.predict(employee_id, list(unknown_items))

        # Get top N recommendations
        top_items = sorted(zip(unknown_items, scores), key=lambda x: -x[1])[:5]
        recommended_items = [item_id for item_id, _ in top_items]

        # Store recommendations for the user
        team_recommendations[employee_id] = recommended_items

    return team_recommendations