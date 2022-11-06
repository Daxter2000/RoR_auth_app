class Company::CompanyController < ApplicationController 
    include CurrentUserConcern

    def get
        if @current_user 
            if !@current_user.user_company.nil?
                company = Company.where(:id => @current_user.user_company.company_id)
                
                render json:  {error: false, company: true, response: CompanySerializer.new(company).as_json}
            else
                render json: {error: false, company: false, response: "NOT_COMPANY" }
            end
        
        else 
            render json: {error: true,company: false,response: "NOT_LOGGED_IN"}
        end
    end

    def create
        if @current_user && !@current_user.user_company
            @company = Company.new(company_params)
            if @company.save!
                new_user_company = UserCompany.new
                new_user_company.user_id = @current_user.id
                new_user_company.company_id = @company.id
                new_user_company.save!
                if @company.persisted?
                    render json: {error: false, status: "created", response: CompanySerializer.new(@company).as_json}
                end
            else
                render json: {error: @company.errors.messages}, status: 442
            end
        else 
            render json:  {error: true, response: "HAS_A_COMPANY"}
        end
    end


    private

        def company_params
            params.require(:company).permit(:name, :RFC, :address)
        end
end