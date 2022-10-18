class Teacher < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :courses, dependent: :destroy

  def self.from_google(google_params)
    teacher = find_or_initialize_by(email: google_params[:email])
    if teacher.new_record?
      teacher.provider = "google_oauth2"
      teacher_attributes =
        google_params.filter do |key|
          (%w[provider last_name first_name uid].include?(key.to_s))
        end
      puts "teacher attributes"
      puts teacher_attributes
      updated_teacher_attributes =
        teacher_attributes.reject { |key, value| value === nil }
      puts "updated teacher attributes"
      puts updated_teacher_attributes
      teacher.assign_attributes(updated_teacher_attributes)
      teacher.save!
    end
    teacher
  end
end
