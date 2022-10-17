# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Student.destroy_all
Course.destroy_all
Enrollment.destroy_all

teacher = Teacher.find_by(email: "freewaytofluency@gmail.com")

student =
  Student.create!(
    email: "student@gmail.com",
    first_name: "Mahiro",
    last_name: "Suzuki",
    student_number: "221231231",
  )
student_two =
  Student.create!(
    email: "student2@gmail.com",
    first_name: "Honami",
    last_name: "Suzuki",
    student_number: "221231231",
  )
student_three =
  student =
    Student.create!(
      email: "student3@gmail.com",
      first_name: "Rin",
      last_name: "Suzuki",
      student_number: "221231231",
    )

course = Course.create!(name: "Academic English", teacher: teacher)

enrollment1 = Enrollment.create!(course: course, student: student)
enrollment2 = Enrollment.create!(course: course, student: student_two)
enrollment3 = Enrollment.create!(course: course, student: student_three)

puts "seeding complete"
