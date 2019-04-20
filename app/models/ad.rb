class Ad < ApplicationRecord
  belongs_to :business
  belongs_to :publisher
end
