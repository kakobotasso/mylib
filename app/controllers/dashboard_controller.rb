class DashboardController < ApplicationController
  before_filter :require_logged_user
  
  def index
    @title = I18n.t('dashboard.index.title')
    @ultimos_adicionados = Book.limit(5).order('id DESC')
    @ultimos_lidos = Book.where(read: true).limit(5).order('id DESC')
    @ultimos_autores = Author.limit(5).order('id DESC')
  end
end