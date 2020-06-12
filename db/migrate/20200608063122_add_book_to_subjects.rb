class AddBookToSubjects < ActiveRecord::Migration[6.0]
  def change
    add_column :subjects, :book, :text
  end
end
