class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.references :user, index: true, foreign_key: true
      t.date :due_date
      t.text :description
      t.string :status, default: "Pending"

      t.timestamps null: false
    end
  end
end
