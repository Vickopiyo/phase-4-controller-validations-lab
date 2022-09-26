class AuthorsController < ApplicationController

# rescue_from ActiveRecord::RecordInvalid, with: :invalid_record

# rescue_from ActiveRecord::RecordNotFound, with: :render_not_found_response
  
  def show
    author = Author.find(params[:id])

    render json: author
  end

  def create
    author = Author.create!(author_params)
    render json: author, status: :created

     rescue ActiveRecord::RecordInvalid => invalid

      render json: { errors: invalid.record.errors   },status: :unprocessable_entity
  end

  private
  # def render_not_found_response
  #   render json: { error: "Auhtor not found" }, status: :unprocessable_entity
  # end


  # def invalid_record(invalid) 

  #   render json: { errors: invalid.record.errors.full_messages  },status: :unprocessable_entity
  # end
  
  def author_params
    params.permit(:email, :name)
  end
  
end
