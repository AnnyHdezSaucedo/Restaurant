class ClientesController < ApplicationController
  def index
  end

  def show
    @clientes = Cliente.find(params[:id])
  end

  def new
    @clientes= Cliente.new
  end

  def create
    @clientes= Cliente.new(params[:clientes])

    if @clientes.save
      redirect_to clientes_path, :notice => "Cliente guardado"
    else
      render "new"
    end
  end

  def edit
    @clientes= Cliente.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
