class CreateUserPhnnumbers < ActiveRecord::Migration[7.0]
  def change
    create_table :user_phnnumbers do |t|
      t.integer :user_id
      t.integer :number
    end
  end
end
