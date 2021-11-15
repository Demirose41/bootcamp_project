class Bootcamp
    def initialize(name, slogan, student_capacity)
      @name = name
      @slogan = slogan
      @student_capacity = student_capacity
      @teachers = []
      @students = []
      @grades = Hash.new { |hash, k| hash[k] = []}
    end

    def name 
        @name
    end

    def slogan
        @slogan
    end

    def student_capacity
        @student_capacity
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def grades 
        @grades
    end

    def hire(new_teacher)
        @teachers << new_teacher
    end

    def enroll(new_student)
        if @students.length < @student_capacity
            @students << new_student
            return true
        end

        false
    end

    def enrolled?(student_name)
        if @students.include?(student_name)
           return true
        end

        false
    end

    def student_to_teacher_ratio
        @students.length / @teachers.length
    end

    def add_grade(student, grade)
        if self.enrolled?(student)
            grades[student] << grade
            return true
        end
        
        false
    end

    def num_grades(student_name)
        grades[student_name].length
    end

    def average_grade(student_name)
        if self.enrolled?(student_name) && self.num_grades(student_name) > 0
            grades = @grades[student_name]
            sum = 0
            grades.each { |grade| sum += grade}
            return sum / grades.length
        end

        nil
    end
end
