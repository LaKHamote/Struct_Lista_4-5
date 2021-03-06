class Teacher < ApplicationRecord
  has_many :students, dependent: :nullify # there is no need to delete teh students if a professor is fired
  has_one :language, dependent: :nullify
  has_one_attached :profile_picture

  validates_presence_of :name, :email, :birth_date
  validates_date :birth_date, on_or_before: lambda { Date.current }
  validates_uniqueness_of :email
  validates :email, email: true
end
