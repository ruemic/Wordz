class CreateWords < ActiveRecord::Migration
  def change
    create_table :words do |t|
      t.string :incorrect
      t.string :correct

      t.timestamps
    end
  end
end
