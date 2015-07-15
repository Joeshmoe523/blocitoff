namespace :todo do
  desc "Deletes items older than seven days"
  task delete_items: :environment do
    items_to_delete = Item.where("created_at <= ?", Time.now - 7.days)

    items_to_delete.destroy_all
  end

end
