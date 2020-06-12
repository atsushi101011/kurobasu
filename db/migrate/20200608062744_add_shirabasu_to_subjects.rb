class AddShirabasuToSubjects < ActiveRecord::Migration[6.0]
  def change
    add_column :subjects, :shirabasu, :text
  end
end
