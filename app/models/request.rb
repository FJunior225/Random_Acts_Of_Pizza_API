class Request < ApplicationRecord

    validates_presence_of :creator, :first_name, :title, :city, :state, :pizzas, :status

    belongs_to :creator, class_name: "User", foreign_key: :creator_id

  def open_requests
    Request.where("created_at > ?", DateTime.now - 4.hours)
  end

  def donated_requests
    Request.where.not(donor_id: nil)
  end

end
