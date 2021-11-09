class Auction < ApplicationRecord
    # Attributes
    enum status: [:created, :active, :finished, :aborted]
    
    # Relationships
    has_many :participants
    has_many :users, through: :participants
    has_one_attached :image
    
    #callback
    before_create :set_price

    private
    def set_price
        self.price = self.starting_price
    end
end
