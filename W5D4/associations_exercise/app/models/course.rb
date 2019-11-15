class Course < ApplicationRecord

  has_many(
    :enrollments,
    primary_key: :id,
    class_name: :Enrollment,
    foreign_key: :course_id


  )

  has_many(
    :enrolled_students,
    primary_key: :id,
    through: :enrollments,
    source: :user
  )

  belongs_to(
    :prerequisites,
    primary_key: :id,
    foreign_key: :prereq_id,
    class_name: :Course
  )

end
