class AuthorsController < ApplicationController
  before_filter :require_logged_user
  
  def index
    @title = I18n.t('authors.index.title')
  	@authors = Author.where(user_id: @current_user).order(:name)
  end

  def new
    @title = I18n.t('authors.new.title')
  	@author = Author.new
  end

  def create
    @author = Author.new(author_params)

    if @author.save
      redirect_to authors_path, success: t('authors.create.salvo_sucesso')
    else
      render :new
    end
  end

  def edit
    @title = I18n.t('authors.edit.title')
    @author = Author.find(params[:id])
  end

  def update
    @author = Author.find(params[:id])
    if @author.update_attributes(author_params)
      redirect_to authors_path, success: t('authors.update.atualizado_sucesso')
    else
      render :edit
    end 
  end

  def destroy
    @author = Author.find(params[:id])
    @author.destroy
 
    redirect_to authors_path, success: t('authors.destroy.deletado_sucesso')
  end

  private
  def author_params
    params.require(:author).permit(:name).merge!({user_id: session[:user_id], slug: params[:author][:name].parameterize})
  end
end
