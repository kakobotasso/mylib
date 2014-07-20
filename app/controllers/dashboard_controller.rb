class DashboardController < ApplicationController
  def index
    @ultimos_adicionados = Book.limit(5).order('id DESC')
    @ultimos_lidos = Book.where(read: true).limit(5).order('id DESC')
    @ultimos_autores = Author.limit(5).order('id DESC')
  end
end