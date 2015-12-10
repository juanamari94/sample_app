class AddIndexToUsersEmail < ActiveRecord::Migration
  def change
    add_index :users, :email, unique: true # makes email an index of users, unique: true makes sure at a database level that the email remains unique. prevents a full-scan.
  end
end
