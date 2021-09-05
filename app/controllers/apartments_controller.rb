class ApartmentsController < ApplicationController
    def index
        apartments = Apartment.all
        render json: apartments
    end

    def show 
        apartment = Apartment.find_by(id:params[:id])
        render json: apartment
    end

    def create 
        apartment = Apartment.create(apartments_params)
        render json: apartment, status: :created
    end

    def update
        apartment = Apartment.find_by(id:params[:id])
        apartment.update(apartments_params)
        render json: apartment, status: :accepted
    end

    def destroy
        apartment = Apartment.find_by(id:params[:id])
        if apartment
        apartment.destroy
        head :no_content
        else 
            render json: {error: "Apartment not found"}
        end
    end

    private

    def apartments_params
        params.permit(:number)
end
end