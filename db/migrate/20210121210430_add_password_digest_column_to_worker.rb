class AddPasswordDigestColumnToWorker < ActiveRecord::Migration[6.0]
  def change
    add_column :workers, :password_digest, :string
  end
end
