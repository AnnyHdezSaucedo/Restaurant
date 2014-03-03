class ClientesController < ApplicationController
  def index
    @clientes= Cliente.all
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
    @clientes = Cliente.find(params[:id])
       
        if @clientes.update_attributes(params[:cliente])
                redirect_to clientes_path, :notice => "El registro cliente se ha actualizado"
        else
                render "edit"
        end
  end

  def destroy
    @clientes = Cliente.find(params[:id])
    @clientes.destroy
    redirect_to clientes_path, :notice => "El registro cliente se ha borrado"
  end
end
