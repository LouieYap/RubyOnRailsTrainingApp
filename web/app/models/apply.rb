class Apply
  include ActiveModel::Model
  attr_accessor :full_name, :gender, :blood_type, :email_address
  validates :email_address, format: { with: URI::MailTo::EMAIL_REGEXP }
  validates :full_name, :gender, :blood_type, :email_address, presence: true
end
