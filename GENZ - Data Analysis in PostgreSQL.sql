- ----------------------------Genz Career Aspiration Analysis-------------------------------------- -
	
select * from employee_preferences;

UPDATE employee_preferences
SET influencing_factors = TRIM(influencing_factors);


/*Ques.1 - What is the gender distribution of respondents from India?*/
select * from employee_preferences;

Select gender, count(*), country 
from employee_preferences
where country = 'India'
group by gender, country;


/*Ques.2 - What percentage of respondents from India are interested in education abroad and sponsorship?*/
select * from employee_preferences;

select round((count(*) filter(where country = 'India' and higher_education_aspiration in ('Yes', 'Needs a Sponsor'))
	* 100.00) / nullif(count(*) filter(where country = 'India'),0), 2
	) as percentage_interested_in_education_abroad_and_sponsorship
    from employee_preferences;


/*Ques.3 - What are the 6 top influences on career aspirations for respondents in India?*/
select * from employee_preferences;

select influencing_factors, count(*) as influence_count
from employee_preferences
where country = 'India'
group by influencing_factors
order by influence_count desc
limit 6;


/*Ques.4 - How do career aspiration influences vary by gender in India?*/
select * from employee_preferences;

select influencing_factors, gender, count(*) as influence_count
	from employee_preferences
	where country = 'India'
	group by influencing_factors,gender;


/*Ques.5 - What percentage of respondents are willing to work for a company for at least 3 years?*/
select * from employee_preferences;

select round(count(*) filter(where country = 'India' and three_year_tenurity = 'Yes')
	* 100.00 / nullif(count(*) filter(where country = 'India'),0),2)
	from employee_preferences;


/*Ques.6 - How many respondents prefer to work for socially impactful companies?*/
select * from employee_preferences;

select social_impact_mission_likelihood, count(*) as respondents
	from employee_preferences
    where country = 'India' and social_impact_mission_likelihood in ('High', 'Very High')
    group by social_impact_mission_likelihood;


/*Ques.7 - How does the preference for socially impactful companies vary by gender?*/
select * from employee_preferences;

select gender, social_impact_mission_likelihood, count(*) as respondents
	from employee_preferences
    where country = 'India'
    group by social_impact_mission_likelihood, gender;


/*Ques.8 - What is the distribution of minimum expected salary in the first three years among respondents?*/
select * from employee_preferences;

select min_expected_salary_first_3_years_monthly, count(*) as respondents
	from employee_preferences
	where country = 'India'
	group by min_expected_salary_first_3_years_monthly
	order by respondents desc;


/*Ques.9 - What is the expected minimum monthly salary in hand?*/
select * from employee_preferences;

select starting_salary_expectation_monthly as min_expected_salary, count(*) as respondents
	from employee_preferences
	where country = 'India' and starting_salary_expectation_monthly is not null
	group by starting_salary_expectation_monthly 
	order by respondents desc;


/*Ques.10 - What percentage of respondents prefer remote working?*/
select * from employee_preferences;

select round(count(*) filter(where country = 'India' and preferred_work_environment = 'Remote')
	* 100.0 / nullif(count(*) filter(where country = 'India'),0), 2) as remotework_prefrence_percentage
	from employee_preferences;


/*Ques.11 - What is the preferred number of daily work hours?*/
select * from employee_preferences;

select preferred_daily_working_hrs, count(*) as respondents
	from employee_preferences 
	where country = 'India' and preferred_daily_working_hrs is not null
	group by preferred_daily_working_hrs
	order by respondents desc
	limit 1;


/*Ques.12 - What are the common work frustrations among respondents?*/
select * from employee_preferences;

select work_frustration_factors, count(*) as respondents
	from employee_preferences
	where country = 'India' and work_frustration_factors is not null
	group by work_frustration_factors
	order by respondents desc;


/*Ques.13 - How does the need for work-life balance interventions vary by gender?*/
select * from employee_preferences;

select gender, full_week_break_frequency_needed, count(*) as respondents
	from employee_preferences 
	where country = 'India' and full_week_break_frequency_needed is not null
	group by full_week_break_frequency_needed, gender;


/*Ques.14 - How many respondents are willing to work under an abusive manager?*/
select * from employee_preferences;

select willingness_to_work_with_abusive_manager, count(*) as respondents
	from employee_preferences
	where country = 'India' and  willingness_to_work_with_abusive_manager = 'Yes'
	group by  willingness_to_work_with_abusive_manager;


/*Ques.15 - What is the distribution of minimum expected salary after five years?*/
select * from employee_preferences;

select min_expected_salary_after_5_years_monthly, count(*) as respondents
	from employee_preferences
	where country ='India' and min_expected_salary_after_5_years_monthly is not null
	group by min_expected_salary_after_5_years_monthly
	order by respondents desc;


/*Ques.16 - What are the remote working preferences by gender?*/
select * from employee_preferences;

select gender, preferred_work_environment, count(*) as respondents
	from employee_preferences
	where country = 'India' and preferred_work_environment = 'Remote'
	group by gender, preferred_work_environment
	order by respondents desc;


/*Ques.17 - What are the top work frustrations for each gender?*/
select * from employee_preferences;

select gender, work_frustration_factors, row_number() over(partition by gender order by count(*) desc) as rank
	from employee_preferences
	where country = 'India' and work_frustration_factors is not null
	group by gender, work_frustration_factors
	order by gender, rank;


/*Ques.18 - What factors boost work happiness and productivity for respondents?*/
select * from employee_preferences;

select factors_for_happiness_and_productivity, count(*) as respondents
	from employee_preferences
	where country = 'India' and factors_for_happiness_and_productivity is not null
	group by factors_for_happiness_and_productivity
	order by respondents desc;


/*Ques.19 - What percentage of respondents need sponsorship for education abroad?*/
select * from employee_preferences;

select round(count(*) filter(where country = 'India' and higher_education_aspiration = 'Needs a Sponsor')
	* 100.0 / nullif(count(*) filter(where country = 'India'),0), 2) as percentage_needs_sponsor
	from employee_preferences;
