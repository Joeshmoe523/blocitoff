class Item < ActiveRecord::Base
  belongs_to :user

  def days_left
    (due_date - Date.today).to_i rescue "THE WORLD IS ENDING"
  end

end
