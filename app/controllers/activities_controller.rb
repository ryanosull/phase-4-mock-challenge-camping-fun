class ActivitiesController < ApplicationController

    def index
        render json: Activity.all, except: [:created_at, :updated_at] status: :ok
    end

    def destroy
        activity = Activity.find_by(id: params[:id])
        if activity
            activity.signups.destroy_all #see video for more here!!!
            activity.destroy
            head :no_content
        else
            render json: {errors: ['Activity not found']}, status: 404
        end
    end


end
