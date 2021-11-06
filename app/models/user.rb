class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
            :recoverable, :rememberable, :validatable, :confirmable, :omniauthable, omniauth_providers: [:google_oauth2] 
    
    attr_accessor :email_confirmation
    
    # variables enum
    enum role: [:client, :admin] 
    
    # Validations
    validates :name, presence: true, length: { minimum: 2 }
    validates :lastname, presence: true, length: { minimum: 2 }
    validates :email, presence:true, uniqueness: true
    validates :email, confirmation: true
    #validates :email,  format: { with: /[a-z]+[0-9]*(@edutecno.com)/, message: 'the format email should be any@edutecno.com'}
    validates :age, numericality: {only_integer: true, greater_than_or_equal_to: 18}

    # Relationships
    has_many :posts
    has_many :participants
    has_many :auctions, through: :participants

    #callbacks
    before_save :format_names
    before_create :initial_type_user

    def self.from_omniauth(access_token)
      # Hash de informacion del usuario registrada en el proveedor (google, facebook, twiter)...
      data = access_token.info # data = {'email' => 'robertdazac@gmail.com', 'name'=> 'roberto'} referencia del hash
      user = User.find_by(email: data['email'])
      unless user
        password = Devise.friendly_token[0,20]
        user = User.new(email: data['email'], email_confirmation: data['email'],
                            name: data['first_name'], lastname: data['last_name'],
                            password: password, password_confirmation: password, age: 18)
          user.skip_confirmation!
          user.save
      end
      user
    end
    
    private
    def format_names
      self.name.downcase!
      self.lastname.downcase!
    end

    def initial_type_user
      self.role = :client
    end
end
