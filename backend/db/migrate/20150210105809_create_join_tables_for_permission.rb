class CreateJoinTablesForRoles < ActiveRecord::Migration
  def change
    create_join_table :roles, :users do |t|
      t.index :user_id
      t.index :role_id
    end
  end
end
