# frozen_string_literal: true

module Api
  module V1
    class ContentsController < ApplicationController
      def index
        contents = ::Contents::UseCases::GetAll::Published.new.call

        render json: represent_all(contents), status: :ok
      end

      private

      def represent_all(resources)
        ::Contents::Representers::Index.all(resources)
      end
    end
  end
end
