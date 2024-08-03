# frozen_string_literal: true

class PostComment < ApplicationRecord
  has_ancestry
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  belongs_to :post, foreign_key: 'post_id'

  validates :content, presence: true
end
