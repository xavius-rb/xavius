require 'active_support/concern'

module Xavius
  module Controllers
    module Base
      extend ActiveSupport::Concern

      included do
        include Xavius::Controllers::Helpers
        before_action :set_resource
      end

      def index
        instance_variable_set(instance_variable_name_for(collection_name), perform_action)
      end

      def create
        respond_to do |format|
          if perform_action
            format.html { redirect_to action_context.resource, notice: success_message }
            format.json { render :show, status: :created, location: action_context.resource }
          else
            format.html { render :new, status: :unprocessable_entity }
            format.json { render json: action_context.resource.errors, status: :unprocessable_entity }
          end
        end
      end

      def update
        respond_to do |format|
          if perform_action
            format.html { redirect_to action_context.resource, notice: success_message }
            format.json { render :show, status: :ok, location: action_context.resource }
          else
            format.html { render :edit, status: :unprocessable_entity }
            format.json { render json: action_context.resource.errors, status: :unprocessable_entity }
          end
        end
      end

      def destroy
        perform_action
        respond_to do |format|
          format.html { redirect_to url_for(resource_class), notice: success_message }
          format.json { head :no_content }
        end
      end

      private
      def perform_action
        action_context.perform
      end

      def action_context
        @action_context ||= action_class.new(context)
      end

      def context
        Xavius::Actions::Context.new(resource: resource, resource_params: -> { resource_params })
      end
    end
  end
end
