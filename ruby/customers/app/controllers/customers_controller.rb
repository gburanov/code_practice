class CustomersController < ApplicationController
    def index
        @customers = Customer.all

        respond_to do |format|
            format.html { }
            format.xml  { render :xml => @customers, :only => [:first_name, :last_name] }
            format.json { render :json => @customers }
        end
    end

    def new
        @customer = Customer.new
    end

    def create
        @customer = Customer.new(params[:customer])
        if @customer.save
            redirect_to @customer
        else
            render :action => 'new'
        end
    end

    def edit
        @customer = Customer.find(params[:id])
    end

    def update
        @customer = Customer.find(params[:id])
        @customer.attributes = params[:customer]

        if @customer.save
            redirect_to @customer
        else
            render :action => 'edit'
        end
    end

    def show
        @customer = Customer.find(params[:id])
        respond_to do |format|
            format.html { }
            format.xml  { render :xml => @customer, :only => [:first_name, :last_name] }
            format.json { render :json => @customer }
        end
    end
end
