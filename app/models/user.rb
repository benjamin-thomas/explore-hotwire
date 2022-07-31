class User < ApplicationRecord
  belongs_to :company

  devise :database_authenticatable, :validatable
end
