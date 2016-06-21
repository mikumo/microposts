class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :company_name
      t.string :company_link  
      t.string :email
      t.string :name
      t.string :department_name
      t.string :password_digest

      t.timestamps null: false

    t.index :email, unique: true # この行を追加
    end
  end
end