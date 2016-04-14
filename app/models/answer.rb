class Answer < ActiveRecord::Base
  # by having this 'belongs to' in the model we can easily fetch the question
  # for a given answer by running:
  # ans = Answer.find(14)
  # q = ans.question
  # belongs_to assumes that the 'answers' table has a foreign_key called
  # question_id (Rails_convention)
  belongs_to :question
end
