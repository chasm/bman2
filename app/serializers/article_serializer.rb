class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_one :user
  has_and_belongs_to_many :tags
end
