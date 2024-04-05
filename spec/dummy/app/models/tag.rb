# frozen_string_literal: true

class Tag < ApplicationRecord
  has_many :post_tags, inverse_of: :tag, dependent: :destroy
  has_many :posts, through: :post_tags

  def to_s
    name
  end

  def self.ransackable_associations(auth_object = nil)
    ["post_tags", "posts"]
  end

  def self.ransackable_attributes(auth_object = nil)
    ["created_at", "id", "id_value", "name", "updated_at"]
  end
end
