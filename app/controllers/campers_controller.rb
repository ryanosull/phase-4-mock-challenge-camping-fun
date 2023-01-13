class CampersController < ApplicationController

    #add your rescue_from

    def index
        render json: Camper.all, except: [:created_at, :updated_at], status: :ok
    end

    def show
        camper = Camper.find_by(id: params[:id])
        if camper
            render json: camper, except: [:created_at, :updated_at], include: [:activities => {except: [:created_at, :updated_at] } ], status: :ok #added last comma
        else
            render json: {errors: ['Camper likely be dead']}, status: :not_found
        end
    end

    def create
        camper = Camper.new(camper_params)
        if camper.valid?
            camper.save
            render json: camper, except: [:created_at, :updated_at]
        else
            render json: {errors: camper.errors.full_messages}, status: 422
        end
    end

    def signup
        new_signup = Signup.new (signup_params)
        if new_signup.valid?
            new_signup.save
            render json: new_signup.activity, except: [:created_at, :updated_at], status: :ok
        else
            render json: {errors: new_signup.errors.full_messages}, status: 422
        end
    end

    private
    def camper_params
        params.permit(:name, :age)
    end

    def signup_params
        params.permit(:time, :camper_id, :activity_id) #another way = :camper, etc. see video
    end




end
