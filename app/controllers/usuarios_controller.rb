class UsuariosController < ApplicationController

    before_action :procurar_id, only: [:show, :edit, :update, :destroy]
    
    def index
        @usuarios = Usuario.all
    end

    def show
    end
    
    def new
        @usuario = Usuario.new
    end

    def create
        @usuario = Usuario.new(params.require(:usuario).permit(:nome, :senha, :conta_id, :data_de_nascimento, :login, :email, 
                               :telefone, :admin, :gerente, :empresa_id))
        if @usuario.save
                redirect_to usuarios_path
        else
            render action: 'new'
        end
    end

    def edit
    end

    def update
        if @usuario.update_attributes(params.require(:usuario).permit(:nome, :senha, :senha_confirmation, :conta_id, :data_de_nascimento, :login, :email, 
                                      :telefone, :admin, :gerente, :empresa_id))
            redirect_to usuarios_path
        else
            render 'edit'
        end
    end

    def destroy
        @usuario.destroy
        redirect_to usuarios_path
    end

    private

    def procurar_id
        @usuario = Usuario.find_by_id(params[:id])
    end
end