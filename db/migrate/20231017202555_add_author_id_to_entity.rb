class AddAuthorIdToEntity < ActiveRecord::Migration[7.0]
  def change
    # Add column author_id to table entities referencing to table users
    add_reference :entities, :author, foreign_key: { to_table: :users }
  end
end
