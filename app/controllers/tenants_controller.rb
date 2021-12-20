class TenantsController < ApplicationController

    before_action :find_tenant, only: [:show, :update, :destroy]

    def index
        render json: Tenant.all, status: :ok
    end

    def show
        render json: @ten, status: :ok
    end

    def create
        new_ten = Tenant.create!(ten_params)
        render json: new_ten, status: :created
    end

    def update
        @ten.update!(ten_params)
        render json: @ten, status: :accepted
    end

    def destroy
        @ten.destroy
        head :no_content
    end

    private

    def find_tenant
        @ten = Tenant.find(params[:id])
    end

    def ten_params
        params.permit(:name, :age)
    end

end
