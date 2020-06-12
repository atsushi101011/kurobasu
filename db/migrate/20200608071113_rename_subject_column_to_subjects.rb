class RenameSubjectColumnToSubjects < ActiveRecord::Migration[6.0]
  def change
    rename_column :subjects, :subject, :name
  end
end
