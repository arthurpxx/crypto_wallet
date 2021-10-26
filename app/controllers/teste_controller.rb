class TesteController < ApplicationController
  def index
    @nome = params[:nome]
    @curso = params[:curso]
    @teste = params[:teste]
  end
end
