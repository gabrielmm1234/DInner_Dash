class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.string :Name
      t.string :Description
      t.decimal :Price, :precision => 12, :scale => 2

      t.timestamps null: false
    end
  end
end
