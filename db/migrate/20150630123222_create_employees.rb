class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :surname
      t.string :age
      t.date :date_of_birth

      t.timestamps
    end
  end
end
