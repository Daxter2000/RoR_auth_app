class User < ApplicationRecord
    has_one :company, through: :user_companies
    has_one :user_company
    has_secure_password

    validates_presence_of :email
    validates_uniqueness_of :email


    
end

