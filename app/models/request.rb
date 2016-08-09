class Request < ApplicationRecord

    validates_presence_of :creator, :first_name, :title, :pizzas, :vendor, :video

    belongs_to :creator, class_name: "User", foreign_key: :creator_id

  def self.open_requests
    Request.where("created_at > ?", DateTime.now - 4.hours)
  end

  def donated_requests
    Request.where.not(donor_id: nil)
  end

  def self.daily_request(user_id)
    return true if Request.where(creator: user_id).where("created_at > ?", DateTime.now - 1.days).any?
    false
  end

end
