ActiveAdmin.register Restaurant do
  index do
    column :name
    column :cuisine
    column :address
    column :contact
    column :web_url
    column :raiting
    default_actions
  end

  filter :name
  filter :cuisine
  filter :contact
  filter :raiting

  # form do |f|
  #   f.inputs "Admin Details" do
  #     f.input :cuisine
  #     f.input :address
  #     f.input :contact
  #   end
  #   f.actions
  # end
  controller do
    def permitted_params
      params.permit restaurant: [:name, :cuisine, :address, :contact, :web_url, :raiting]
    end
  end
end