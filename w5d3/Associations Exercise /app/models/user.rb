# == Schema Information
#
# Table name: users
#
#  id         :bigint           not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class User < ApplicationRecord
    
    has_many :enrollments,
        primary_key: :id,
        foreign_key: :student_id,
        class_name: :Enrollment
    
    has_many :enrolled_courses,
        through: :enrollments,
        source: :course
        # primary_key: :id,
        # foreign_key: :course_id,
        # class_name: :Enrollment
    
end

# class class < ApplicationRecord
#   has_many :appointments
#   has_many :patients, through: :appointments
# end
# class enrollments < ApplicationRecord
#   belongs_to :physician
#   belongs_to :patient
# end
# class user < ApplicationRecord
#   has_many :appointments
#   has_many :physicians, through: :appointments
# end