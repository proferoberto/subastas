class User < ApplicationRecord
    attr_accessor :email_confirmation
    
    # Validations
    validates :name, presence: true, length: { minimum: 2 }
    validates :lastname, presence: true, length: { minimum: 2 }
    validates :email, presence:true, uniqueness: true
    validates :email, confirmation: true
    validates :email,  format: { with: /[a-z]+[0-9]*(@edutecno.com)/, message: 'the format email should be any@edutecno.com'}
    validates :age, numericality: {only_integer: true, greater_than_or_equal_to: 18}

    # Relationships
    has_many :posts
    has_many :participants
    has_many :auctions, through: :participants
end
