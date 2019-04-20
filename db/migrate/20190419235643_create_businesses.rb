class CreateBusinesses < ActiveRecord::Migration[5.1]
  def change
    create_table :businesses do |t|
      t.string :name
      t.string :address
      t.string :city
      t.string :state
      t.string :country
      t.string :phone
      t.string :description
      t.string :site_url

      t.timestamps
    end
  end
end
