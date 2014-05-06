class Article < Post
  has_and_belongs_to_many :tags
end
