class TenantsController < ApplicationController
    def index
         tenants = Tenant.all
         render json: tenants, include: ["leases", "apartments"]
    end

    def show 
        tenant = Tenant.find(params[:id])
        render json: tenant
    end

    def create
        tenant = Tenant.create(tenant_params)
        render json: tenant
    end

    def updated
        tenant = Tenant.find(params[:id])
        if tenant
            tenant.update(tenant_params)
            render json: tenant, status: :accepted
        else
            render{error:"Tenant not found"}
        end
    end

    def destroy
        tenant = Tenant.find(params[:id])
        tenant.destroy
        head :no_content
    end

    private
    
    def tenant_params
        params.permit(:name, :age)
    end 

end
