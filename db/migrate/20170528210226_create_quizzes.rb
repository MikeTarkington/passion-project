class CreateQuizzes < ActiveRecord::Migration
  def change
    create_table :quizzes do |t|
      t.string :question_1, null: false
      t.string :question_2, null: false
      t.string :question_3, null: false
      t.string :question_4, null: false
      t.string :question_5, null: false
    end
  end
end
