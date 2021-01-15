class Worker < ApplicationRecord
    # validates :email, uniqueness: true
    validates :service, presence: true
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :country, presence: true
    validates :city, presence: true
    validates :business_name, presence: true
    validates :phone_number, presence: true
    validates :email, presence: true
    validates :email, uniqueness: true
    validates :password, presence: true
end
