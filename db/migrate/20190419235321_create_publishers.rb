class CreatePublishers < ActiveRecord::Migration[5.1]
  def change
    create_table :publishers do |t|
      t.string :name
      t.string :description
      t.decimal :adPrice
      t.string :currency
      t.string :address
      t.string :phone

      t.timestamps
    end
  end
end
