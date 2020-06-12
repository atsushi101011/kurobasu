class AddDepartmentIdToSubjects < ActiveRecord::Migration[6.0]
  def change
    add_column :subjects, :department_id, :integer
  end
end
