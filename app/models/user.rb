class User < ApplicationRecord
	has_many :account, dependent: :delete_all
end
