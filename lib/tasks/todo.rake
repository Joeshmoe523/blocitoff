namespace :todo do
  desc "Deletes items older than seven days"
  task delete_items: :environment do
    items_to_delete = Item.where("due_date <= ?", Time.now - 7.days)

    items_to_delete.each do |item|
      item.status = "Archived"
      item.save
    end
  end

end
