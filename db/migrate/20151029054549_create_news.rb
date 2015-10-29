class CreateNews < ActiveRecord::Migration
  def change
    create_table :news do |t|
      t.string :title
      t.boolean :favorite, default: false

      t.timestamps null: false
    end
  end
end
