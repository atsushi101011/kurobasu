class AddSubjectIdToPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :posts, :subject_id, :integer
  end
end
