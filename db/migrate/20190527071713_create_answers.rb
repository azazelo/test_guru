class CreateAnswers < ActiveRecord::Migration[5.2]
  def change
    create_table :answers do |t|
      t.references :question, foreign_key: true, null: false
      t.references :user, foreign_key: true, null: false
      t.text :body
      t.boolean :correct, default: 'Yes'

      t.timestamps
    end
  end
end
