class Request < ApplicationRecord

    validates_presence_of :creator, :first_name, :title, :pizzas, :vendor, :video

    belongs_to :creator, class_name: "User", foreign_key: :creator_id

  def self.open_requests
    # DateTime.now - 4.hours
    Request.where("created_at > ?", DateTime.now).order('created_at ASC')
  end

  def self.totalPizzasDonated
    Request.where.not(donor_id: nil).map{|request| request.pizzas}.reduce(:+)
  end

end
