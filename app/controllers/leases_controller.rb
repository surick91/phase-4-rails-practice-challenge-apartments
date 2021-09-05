class LeasesController < ApplicationController
    def create
        lease = Lease.create(lease_params)
        render json: lease, status: :created
    end

    def index 
        leases = Tenant.all
        render json:leases, include:["leases"]
    end

    def show 
        lease = Lease.find(params[:id])
        render json: lease
    end

    private

    def lease_params
        params.permit(:rent)
    end
end
