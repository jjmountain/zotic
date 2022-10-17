class Student < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  # devise :omniauthable, omniauth_providers: [:google_oauth2]

  has_many :enrollments, dependent: :destroy
end
