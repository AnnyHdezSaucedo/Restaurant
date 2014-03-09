# Controller class
class ClientesController < ApplicationController
  def index
    @clientes = Cliente.all
  end
  def show
    @clientes = Cliente.find(params[:id])
  end
  def new
    @clientes = Cliente.new
  end
  def create
    @clientes = Cliente.new(cliente_params)
    if @clientes.save
      redirect_to @clientes, :notice => 'Client was successfully created.'
      # redirect_to :action => :show, :id => @clientes.id
    else
      render "new"
  end
  end
  def edit
    @clientes = Cliente.find(params[:id])
  end
  def update
    @clientes = Cliente.find(params[:id])
    if @clientes.update(cliente_params)
    # redirect_to @client, :notice => 'Client was successfully updated.'
      redirect_to :action => :show, :id => @clientes.id
    else
      render "edit"
    end
  end
  def destroy
    @clientes = Cliente.find(params[:id])
    @clientes.destroy
    redirect_to clientes_url
    # redirect_to :action => :index
  end
  private
  def cliente_params
  params.require(:cliente).permit(:c_targeta_cliente, :nombre, :a_paterno, :a_materno, :email, :t_celular, :domicilio, :fecha_alta, :c_postal, :sexo, :fecha_alta)
  end
end
