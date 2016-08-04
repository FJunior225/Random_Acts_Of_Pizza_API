class User < ApplicationRecord

    validates_presence_of :access_token, :first_name
    validates_uniqueness_of :access_token, :email
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

    has_one :request, class_name: "Request", foreign_key: :creator_id

end
