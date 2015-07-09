class Item < ActiveRecord::Base
  belongs_to :user

  def days_left
    (Time.now - self.created_at).round
  end


end
