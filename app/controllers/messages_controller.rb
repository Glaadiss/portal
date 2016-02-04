class MessagesController < ApplicationController
	before_action :find_message, only: [:show, :destroy, :update, :edit]

	def index
		@messages = Message.all

	end

	def new
		@message = Message.new

	end

	def create
		@message = Message.new(message_params)
		@message.user_id = current_user.id

		if @message.save 
			token = Message.last.token
			logger.info "blahdsadsadsadsadas"
			logger.info params[:message][:user]
			logger.info "blahdsadsadsadsadas"
			logger.info token
			arr = params[:message][:user]
			arr.each  do |email|
				if !email.empty?
					UserMailer.notice(email,token).deliver_now
				end
				
			end
			redirect_to root_path
		else
			render 'new'
		end
	end

	def show
	end

	def destroy
		@message.destroy
		redirect_to root_path
		
	end

	private
		def message_params
			params.require(:message).permit(:title, :description)
		end

		def find_message
			@message = Post.find_by(token: params[:token])
		end
end
