def calculate_score(employee, project):
    skill_weight = 1.5
    personality_weight = 0.2
    hobbies_weight = 0.5

    total_skills = len(project.required_skills.all())
    employee_skills = employee.skills.filter(id__in=project.required_skills.values_list('id', flat=True))
    skill_score = (len(employee_skills) / total_skills) * 100 * skill_weight if total_skills > 0 else 0

    if employee.personality:
        personality_score = 100 * personality_weight if employee.personality in project.preferred_personalities.all() else 0
    else:
        personality_score = 0

    employee_hobbies = employee.hobbies.all()
    total_hobbies = len(project.preferred_hobbies.all())
    matched_hobbies = employee_hobbies.filter(id__in=project.preferred_hobbies.values_list('id', flat=True))
    hobbies_score = (len(matched_hobbies) / total_hobbies) * 100 * hobbies_weight if total_hobbies > 0 else 0

    total_score = skill_score + personality_score + hobbies_score

    scores = {
        'skill_score': skill_score,
        'personality_score': personality_score,
        'hobbies_score': hobbies_score,
        'total_score': total_score
    }

    return scores


def get_top_recommendations(project, employees, top_count=20):
    scored_employees = [(employee, calculate_score(employee, project)) for employee in employees]

    sorted_scores = sorted(scored_employees, key=lambda x: x[1]['total_score'], reverse=True)

    top_recommendations = sorted_scores[:top_count]

    recommendations = [{'employee': emp, **scores} for emp, scores in top_recommendations]
    return recommendations
