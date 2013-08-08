class CreateDiscussionResponses < ActiveRecord::Migration
  def change
    create_table :discussion_responses do |t|
      t.text :content
      t.integer :discussion_id

      t.timestamps
    end
  end
end
