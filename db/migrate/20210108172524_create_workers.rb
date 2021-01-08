class CreateWorkers < ActiveRecord::Migration[6.0]
  def change
    create_table :workers do |t|
      t.string :first_name
      t.string :last_name
      t.string :country
      t.string :city
      t.string :business_name
      t.integer :phone_number
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
