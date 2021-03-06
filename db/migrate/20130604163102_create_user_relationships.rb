class CreateUserRelationships < ActiveRecord::Migration
  def change
    create_table :user_relationships do |t|
      t.integer :follower_id
      t.integer :followed_id

      t.timestamps
    end

    add_index :user_relationships, :follower_id
    add_index :user_relationships, :followed_id
    #This enforces uniqueness so that a user can't follower another user more than once
    add_index :user_relationships, [:follower_id, :followed_id], unique: true
  end
end
