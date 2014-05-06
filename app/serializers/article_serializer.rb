class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body
  has_one :user
  has_many :tags
  has_many :comments
end
