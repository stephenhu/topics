class InitSchema < ActiveRecord::Migration

  def self.up

    create_table :users do |t|
      t.string :email, :null => false
      t.string :salt
      t.string :uuid
      t.string :icon, :default => 'glyphicons_003_user.png'
      t.integer :karma, :default => 0
      t.timestamps
    end

    create_table :topics do |t|
      t.belongs_to :user
      t.string :user_id
      t.string :name, :null => false
      t.text :summary, :null => false
      t.string :image
      t.string :url
      t.integer :votes, :default => 0
      t.timestamps
    end

    create_table :tags do |t|
      t.belongs_to :topic
      t.integer :topic_id
      t.string :tag, :null => false
      t.timestamps
    end

    create_table :topictags do |t|
      t.integer :topic_id
      t.integer :tag_id
    end

    create_table :attachments do |t|
      t.belongs_to :topic
      t.integer :topic_id
      t.string :attachment, :null => false
    end

    create_table :comments do |t|
      t.belongs_to :topic
      t.integer :topic_id
      t.text :comment, :null => false
      t.timestamps
    end

  end

  def self.down

    drop_table :users

    drop_table :topics

    drop_table :tags

    drop_table :topictags

    drop_table :attachments

    drop_table :comments

  end

end

