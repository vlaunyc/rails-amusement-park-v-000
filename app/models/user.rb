class User < ActiveRecord::Base
  has_many :rides
  has_many :attractions, through: :rides

  has_secure_password

  def too_broke(attraction)
    self.tickets < attraction.tickets
  end

  def too_short(attraction)
    self.height < attraction.min_height
  end

  def mood
    if nausea > happiness
      "sad"
    else
      "happy"
    end
  end
end
