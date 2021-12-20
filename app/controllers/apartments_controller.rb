class ApartmentsController < ApplicationController

    before_action :find_apartment, only: [:show, :update, :destroy]

    def index
        render json: Apartment.all, status: :ok
    end

    def show
        render json: @apt, status: :ok
    end

    def create
        new_apt = Apartment.create!(ap_params)
        render json: new_apt, status: :created
    end

    def update
        @apt.update!(ap_params)
        render json: @apt, status: :accepted
    end

    def destroy
        @apt.destroy
        head :no_content
    end


    private

    def ap_params
        params.permit(:number)
    end

    def find_apartment
        @apt = Apartment.find(params[:id])
    end

end
