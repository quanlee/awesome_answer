class User < ActiveRecord::Base
  # has_secure_password does the following
  # 1- it adds attributes accessors: password and password_confirmation
  # 2- it adds validations: password must be present on creation
  # 3- if password confirmation is present, it will make sure it's equal to password
  # 4- PAssword length should be less than or equal to 72 characters
  # 5- It will hash the password using BCrypt and stores the hash digest
  has_secure_password
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_many :questions, dependent: :nullify # identifies the questions created by the user
  has_many :answers, dependent: :nullify

  has_many :likes, dependent: :destroy
  has_many :votes, dependent: :destroy
  has_many :voted_questions, through: :votes, source: :question
  # we're using 'source' option in here because we used 'liked_questions' instead
  # of 'questions' (convention) because we used 'has_many :questions' earlier.
  # inside the 'like' model there is no association called 'liked_question'
  # so we have to specify the source for rails to know how to match it

  has_many :liked_questions, through: :likes, source: :question # identifies the questions liked by the user

  VALID_EMAIL_REGEX = /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i
  validates :email, uniqueness: true, presence: true, format: VALID_EMAIL_REGEX

  def full_name
    "#{first_name} #{last_name}"
  end
end
