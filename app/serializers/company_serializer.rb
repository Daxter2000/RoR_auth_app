class CompanySerializer
    include FastJsonapi::ObjectSerializer
    attributes :name, :RFC, :address, :id
    has_many :user_companies
end