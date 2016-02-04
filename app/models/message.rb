class Message < ActiveRecord::Base
	include Tokenable
	belongs_to :user
end
