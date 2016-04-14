class Question < ActiveRecord::Base

  # when using 'has_many' you must put a symbol for the associated record in
  # plural format
  # you also should provide the ;dependant option which can be either:
  # :destroy: which deletes all the answers when the question is deleted
  # :nullify: which makes 'question_id' NULL for all associated answers
  has_many :answer, dependant: :destroy 


  validates :title, {presence: true, uniqueness: {message: "must be unique!!!"}}
  validates :body, length: {minimum: 5, message: "make me longer than 5"}
  validates :body, length: {maximum: 10, message: "make me 10 or shorter"}

# this validates that the combination of title amd body must be unique
# it means that title by itself doesnt have to be unique and body bvby itself doesnt hgave to be unique
# but the combination of the two must be unique

  validates :title, uniqueness: {scope: :body}

  validate :no_monkey
  def self.search search_term
    Question.where(["body ilike ?", "%#{search_term}%"])
  end

  def self.search_not_safe search_term
    Question.where("body ilike %#{search_term}%")
  end

  private
  def no_monkey
    if title.present? && title.downcase.include?("monkey")
      errors.add(:title, "No monkeys")
    end
  end
end
