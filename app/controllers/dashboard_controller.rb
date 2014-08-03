class DashboardController < ApplicationController
  before_filter :require_logged_user
  
  def index
    @title = I18n.t('dashboard.index.title')

    @ultimos_adicionados = Book.user(@current_user).wishlist.dashboard
    @ultimos_lidos = Book.user(@current_user).read.dashboard
    @ultimos_autores = Author.user(@current_user).dashboard
    @livros_comprados = Book.user(@current_user).bought.dashboard
  end
end