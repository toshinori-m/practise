module Api
  module V1
    class UsersController < ApplicationController
      def index
        users_array = muster
        return render json: users_array, status: 200
      end

      def show
        return render json: { message: '成功しました', data: @user = User.find(params[:id]) }, status: 200
      end

      def create
        users = add_user
        return render json: { message: '成功しました', data: users }, status: 200 if users.save
        return render json: { message: '保存出来ませんでした', errors: users.errors.messages }, status: :bad_request
      end

      def destroy
        users = delete_specified
        return render json: { message: '削除に成功しました' }, status: 200 if users.destroy
        return render json: { message: '削除に失敗' }, status: 400
      end

      private
      def muster
        User.all
        users = sort_users
        users_array(users)
      end

      def sort_users
        User.order(created_at: :desc)
      end

      def users_array(users)
        users.map do |user|
          { id: user.id,
            content1: user.content1,
            content2: user.content2,
            content3: user.content3,
            content4: user.content4,
            created_at: user.created_at
          }
        end
      end

      def add_user
        User.new(content1: params[:content1], content2: params[:content2], content3: params[:content3], content4: params[:content4])
      end

      def delete_specified
        User.find(params[:id])
      end
    end
  end
end
