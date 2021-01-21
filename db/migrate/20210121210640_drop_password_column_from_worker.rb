class DropPasswordColumnFromWorker < ActiveRecord::Migration[6.0]
  def change
    remove_column :workers, :password, :string
  end
end
