class Mutations::CreateCourse < Mutations::BaseMutation
    argument :name, String, required: true
    argument :teacherId, ID, required: true

    field :course, Types::CourseType, null: false
    field :errors, [String], null: false

    def resolve(name:, teacherId:)
        teacher = Teacher.find(teacherId)
        course = teacher.courses.build(name: name)
        if course.save
            {
                course: course,
                errors: []
            }
        else
            {
                course: nil,
                errors: course.errors.full_messages
            }
        end
    end
end