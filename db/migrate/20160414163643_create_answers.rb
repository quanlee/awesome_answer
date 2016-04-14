class CreateAnswers < ActiveRecord::Migration
  def change
    create_table :answers do |t|
      # t.references creates an integer field called question_id (rails convention)
      # which is the foreign key for the answers table to the questions table
      # foreign key: true automatically crtates the foreign key constraint
      # index: true automatically creates an index on the question_id field
      t.references :question, index: true, foreign_key: true
      t.text :body

      t.timestamps null: false
    end
  end
end
