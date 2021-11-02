class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
    
    attr_accessor :email_confirmation
    
    # variables enum
    enum role: [:client, :admin] 
    
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

    #callbacks
    before_save :format_names
    before_create :initial_type_user

    private
    def format_names
      self.name.downcase!
      self.lastname.downcase!
    end

    def initial_type_user
      self.role = :client
    end
end
