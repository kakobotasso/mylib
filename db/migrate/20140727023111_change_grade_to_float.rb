class ChangeGradeToFloat < ActiveRecord::Migration
  def change
    change_column :books, :grade, :float
  end
end
