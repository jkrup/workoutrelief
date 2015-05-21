class ConfirmationCode < ActiveRecord::Base
  belongs_to :user
  attr_accessible :code
end
