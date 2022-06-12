module Api
  module V1
    class GuildsController < ApplicationController
      before_action :set_guild, only: [:show, :update, :destroy]

      def index
        guilds = Guild.order(created_at: :desc)
        render json: { status: 'SUCCESS', message: 'Loaded guilds', data: guilds }
      end

      def show
        render json: { status: 'SUCCESS', message: 'Loaded the guild', data: @guild }
      end

      def create
        guild = Guild.new(guild_params)
        if guild.save
          render json: { status: 'SUCCESS', data: guild }
        else
          render json: { status: 'ERROR', data: guild.errors }
        end
      end

      def destroy
        @guild.destroy
        render json: { status: 'SUCCESS', message: 'Deleted the guild', data: @guild }
      end

      def update
        if @guild.update(guild_params)
          render json: { status: 'SUCCESS', message: 'Updated the guild', data: @guild }
        else
          render json: { status: 'SUCCESS', message: 'Not updated', data: @guild.errors }
        end
      end

      private

      def set_guild
        @guild = Guild.find(params[:id])
      end

      def guild_params
        params.permit(:id, :name, :tts_blocked)
      end
    end
  end
end
