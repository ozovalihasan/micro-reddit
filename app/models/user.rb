class EmailValidator < ActiveModel::EachValidator
  def validate_each(record, attribute, value)
    return if value =~ /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i

    record.errors[attribute] << (options[:message] || 'is not an email')
  end
end

class User < ApplicationRecord
  has_many :posts
  has_many :comments
  validates :username, uniqueness: true, presence: true, length: { minimum: 3 }
  validates :email, uniqueness: true, presence: true, email: true
end
