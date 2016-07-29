class Request < ApplicationRecord
    validates_presence_of :creator, :title, :video, :pizzas, :status
    validates_uniqueness_of :creator, :title

    belongs_to :creator, class_name: "User", foreign_key: :creator_id
end
