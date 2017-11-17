class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :nome
      t.string :sobrenome
      t.string :email
      t.string :password_digest
      t.string :username
      t.string :nivel_usuario
      t.integer :cliente_id

      t.timestamps null: false
    end
  end
end
