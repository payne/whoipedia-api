module Api
  module V1
    class EpisodesController < ApplicationController
      def index
        render json: Episode.all
      end

      def show
        episode = Episode.find(params[:id])
        render json: episode
      end

      def update
        episode = Episode.find(params[:id])
        episode.update_from_params(episode_params)
        render json: episode
      end

      def create
        episode = Episode.new_from_params(episode_params)
        render json: episode
      end

      def destroy
        episode = Episode.find(params[:id])
        episode.destroy
      end

      private

        def episode_params
          params.require(:episode).permit(:name, :air_date, :description, :writer_ids => [], :season => [:id, :number])
        end
    end
  end
end