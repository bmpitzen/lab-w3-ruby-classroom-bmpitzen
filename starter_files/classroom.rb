# Given a grade_hash, student name, and assignment number, return the score
# for that student and assignment. Note that Ruby counts arrays from 0, but
# we are referring to them as 1-10.
def assignment_score(data, name, assignment)
    data[name][assignment -1]
end

# Given a grade_hash and assignment number, return all scores for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_scores(data, assignment)
    data.values.map { |scores| scores[assignment-1] }
end

# Given a grade_hash and assignment number, return the average score for that
# assignment. Note that Ruby counts arrays from 0, but we are referring to
# them as 1-10.
def assignment_average_score(data, assignment)
    all_scores = data.values.map do |scores|
        scores[assignment - 1]
    end
    (all_scores.sum)/(all_scores.length)
end

# Return a hash of students and their average score.
# TIP: To convert an array like [[:indiana, 90], [:nevada, 80]] to a hash,
# use .to_h. Also look at Hash#transform_values.
def averages(data)
    data.transform_values { |scores| (scores.sum/scores.length) }
end

# Return a letter grade for a numerical score.
# 90+ => A
# 80-89 => B
# 70-79 => C
# 60-69 => D
# < 60 => F
def letter_grade(score)
    if score >= 90 
       return  "A"
    elsif score >= 80
        "B"
    elsif score >= 70
        "C"
    elsif score >= 60
        "D"
    else 
        "F"
end
end

# Return a hash of students and their final letter grade, as determined
# by their average.
def final_letter_grades(scores)
    averages(scores).transform_values { |avg_score| letter_grade(avg_score)}
end

# Return the average for the entire class.
def class_average(data)
    ind_avgs = averages(data).values
    ind_avgs.sum/ind_avgs.length
end
