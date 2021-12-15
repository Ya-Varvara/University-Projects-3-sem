class Armst < ApplicationRecord
  include ActiveModel::Validations
  # paginates_per 10

  validates :number, presence: true, uniqueness: true
end
