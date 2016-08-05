class User < ApplicationRecord

    validates_presence_of :FB_userID, :first_name
    validates_uniqueness_of :FB_userID, :email
    validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :on => :create

    has_many :requests, class_name: "Request", foreign_key: :creator_id

end
