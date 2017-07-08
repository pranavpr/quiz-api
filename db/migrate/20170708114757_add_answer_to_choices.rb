class AddAnswerToChoices < ActiveRecord::Migration[5.1]
  def change
    add_column :choices, :answer, :boolean, default: false
  end
end
