class CreateCustomers < ActiveRecord::Migration[6.1]
  def change
    create_table :customers do |t|
    t.string :first_name
      t.string :last_name
      t.string :first_name_kana
      t.string :last_name_kana
      t.string :address
      t.string :post_code
      t.string :phone_number
      t.boolean :is_deleted, null: false, default: false
      t.timestamps
    end
  end
end
