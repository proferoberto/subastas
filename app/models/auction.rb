class Auction < ApplicationRecord
    # Attributes
    enum status: [:created, :active, :finished, :aborted]
    
    # Relationships
    has_many :participants
    has_many :users, through: :participants
end
