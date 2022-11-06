class Company < ApplicationRecord
    has_many :user_companies

    validates :name , :address , :presence => true
end
