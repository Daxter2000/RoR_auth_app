class Clients::ClientsController < ApplicationController
    include CurrentUserConcern

    def get
        if @current_user
            clients =  Client.where(:company_id => @current_user.user_company.company_id) 
            if clients.blank?
                render json: {error: false, response: "NO_CLIENTS"}
            else
                render json: {error: false, response: ClientSerializer.new(clients).as_json}
            end
        else 
            render json: {error: true, response: "NOT_LOGGED_IN"}, status: 401

        end
    end

    def create
        if @current_user
            client = Client.new(client_params)
            client.company_id = @current_user.user_company.company_id
            if client.save!
                render json: {error: false, status: "CREATED", response: ClientSerializer.new(client).as_json}
            else
                render json: {error: true, status: "NOT_CREATED", response: client.errors.messages}
            end
        end

    end

    def update
        if @current_user
            client = Client.find(params[:id])
            client.update(client_params)
            if client.save!
                render json: {error: false, status: "UPDATED", response: ClientSerializer.new(client).as_json}
            else
                render json: {error: true, status: "FAILED_TO_UPDATE", response: client.errors.messages}
            end
        else 
            render json: {error: true, response: "NOT_LOGGED_IN"}, status: 401
        end
    end

    def delete
        if @current_user
            client = Client.find(params[:id])
            if client.destroy
                head :no_content
            else
                render json: {error: true, status: "FAILED_TO_DESTROY", response: client.errors.messages}
            end
        else 
            render json: {error: true, response: "NOT_LOGGED_IN"}, status: 401
        end
    end

    private

    def client_params
        params.require(:client).permit(
            :names, 
            :ap_pat, 
            :ap_mat, 
            :telefono, 
            :canal, 
            :calle, 
            :colonia, 
            :numero, 
            :referencias, 
            :notas, 
            :company_id)
    end

end

