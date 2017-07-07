ActiveAdmin.register Question do
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # permit_params :list, :of, :attributes, :on, :model
  #
  # or
  #
  # permit_params do
  #   permitted = [:permitted, :attributes]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

  permit_params :title, :description, :quiz_id, :photo

  show do |question|
    attributes_table do
      row :quiz
      row :title
      row :description
      row :photo do
        question.photo? ? image_tag(question.photo.url, height: '100') : content_tag(:span, "No photo yet")
      end
    end
    active_admin_comments
  end

  form :html => { :enctype => "multipart/form-data" } do |f|
    f.inputs do
      f.input :quiz
      f.input :title
      f.input :description
      f.input :photo, hint: f.question.photo? ? image_tag(f.question.photo.url, height: '100') : content_tag(:span, "Upload JPG/PNG/GIF image")
    end
    f.actions
  end
end
