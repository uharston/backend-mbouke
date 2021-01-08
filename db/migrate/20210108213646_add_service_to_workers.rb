class AddServiceToWorkers < ActiveRecord::Migration[6.0]
  def change
    add_column :workers, :service, :string
  end
end
