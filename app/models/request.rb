class Request < ApplicationRecord

    validates_presence_of :creator, :title, :city, :state, :pizzas, :status

    belongs_to :creator, class_name: "User", foreign_key: :creator_id

  def open_requests
    self.requests.where("end_time > ?", DateTime.now)
  end

  def expired_requests
    self.requests.where("end_time < ?", DateTime.now).reverse
  end

  def filled_requests
    self.open_requests.find_all { |request| !request.has_photos?(self.id)}.reverse
  end

end
