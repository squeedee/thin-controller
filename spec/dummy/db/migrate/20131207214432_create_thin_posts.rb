class CreateThinPosts < ActiveRecord::Migration
  def change
    create_table :thin_posts do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
