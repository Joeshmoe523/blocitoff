every 1.day, :at => '6:00 am' do 
  rake "todo:delete_items"
end
