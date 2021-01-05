class Usuario < ActiveRecord::Migration[6.1]
  def change
    create_table :usr do |t|
      t.string   :login
      t.string   :nome
      t.string   :email
      t.string   :senha
      t.date     :data_de_nascimento
      t.boolean  :admin
      t.boolean  :gerente
      t.string   :telefone
      t.integer  :conta_id
      t.timestamps
    end
  end
end
