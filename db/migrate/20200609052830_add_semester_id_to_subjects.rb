class AddSemesterIdToSubjects < ActiveRecord::Migration[6.0]

  def change
    add_column :subjects, :semester_id, :integer
  end
end
