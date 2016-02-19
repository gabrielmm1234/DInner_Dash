class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :Name
      t.string :Description
      t.float :Price

      t.timestamps null: false
    end
  end
end
