class CreateChoices < ActiveRecord::Migration
  def change
      create_table :choices do |t|
        t.string :content, null: false
        t.integer :question_id, null: false
        t.boolean :selected, default: false
        t.integer :reader_id

        t.timestamps null:false
    end
  end
end
