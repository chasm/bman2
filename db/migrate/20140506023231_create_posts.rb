class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :type
      t.string :title
      t.text :body
      t.references :user, index: true
      t.references :post, index: true

      t.timestamps
    end

    create_table :posts_tags, id: false do |t|
      t.references :article, index: true
      t.references :tag, index: true
    end
  end
end
