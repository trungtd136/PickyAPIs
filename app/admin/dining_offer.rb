ActiveAdmin.register DiningOffer do
index do
  	column :restaurant
    column :title
    column :description
    column :image_url
    column :web_url    
    default_actions
  end

  filter :title
  filter :description
  filter :restaurant

  controller do
    def permitted_params
      params.permit offer: [:title, :description, :image_url, :web_url, :restaurant_id]
    end
  end
end
