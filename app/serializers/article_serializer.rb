class ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :text, :comments

end
