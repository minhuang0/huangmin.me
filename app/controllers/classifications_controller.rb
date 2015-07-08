# -*- encoding : utf-8 -*-
class ClassificationsController < ApplicationController
  before_action :authenticate_user!
  def new
    @classification = Classification.new
  end

  def index
    @classifications = Classification.all
  end

  def create
    @classification = Classification.new(classification_params)
    @classification.save

    redirect_to @classification
  end

  def show
    @classification = Classification.find(params[:id])
  end

  def edit
    @classification = Classification.find(params[:id])
  end

  def update
    @classification = Classification.find(params[:id])
    if @classification.update(classification_params)
      redirect_to @classification
    else
      render 'edit'
    end
  end

  def destroy
    @classification = Classification.find(params[:id])
    @classification.destroy
    redirect_to classifications_path
  end

  private
  def classification_params
    params.require(:classification).permit(:name, :display )
  end
end
