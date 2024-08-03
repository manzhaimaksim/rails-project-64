# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :category
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :comments, foreign_key: 'post_id', class_name: 'PostComment'

  validates :title, presence: true
  validates :body, presence: true
end
