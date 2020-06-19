class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |h,k| h[k] = Array.new }
    end

    def name
        @name
    end 

    def slogan
        @slogan
    end 

    def teachers 
        @teachers
    end 

    def students 
        @students
    end 

    def hire(teacher)
        @teachers << teacher
    end

    def enroll(student)
        if @students.length < @student_capacity
            @students << student ; return true
        else
            return false
        end 
    end

    def enrolled?(student)
        @students.include?(student)
    end

    def student_to_teacher_ratio
        (@students.length / @teachers.length).to_i
    end

    def add_grade(student, grade)
        if enrolled?(student)
            @grades[student] << grade
            return true 
        else 
            return false
        end
    end

    def num_grades(student)
        @grades[student].length
    end

    def average_grade(student)
        if !enrolled?(student) || !@grades.has_key?(student) # (could use num_grades(student) == 0)
            nil
        else
            (@grades[student].sum / num_grades(student)).to_i
        end
    end



end
