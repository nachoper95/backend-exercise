class CreateAds < ActiveRecord::Migration[5.1]
  def change
    create_table :ads do |t|
      t.references :business, foreign_key: true
      t.references :publisher, foreign_key: true
      t.string :title
      t.string :description
      t.datetime :start_date
      t.datetime :end_date
      t.string :print_version_url
      t.integer :state, default: 0

      t.timestamps
    end
  end
end
