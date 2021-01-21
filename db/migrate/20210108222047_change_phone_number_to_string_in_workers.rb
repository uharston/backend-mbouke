class ChangePhoneNumberToStringInWorkers < ActiveRecord::Migration[6.0]
  def change
    change_column :workers, :phone_number, :string
  end
end
