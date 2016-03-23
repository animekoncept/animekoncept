require "administrate/base_dashboard"

class EventDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id:           Field::Number,
    name:         Field::String,
    description:  Field::Text,
    location:     Field::String,
    starts_on:    Field::DateTime,
    ends_on:      Field::DateTime,
    age:          Field::String,
    created_at:   Field::DateTime,
    updated_at:   Field::DateTime,
    header_image: PaperclipField,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :description,
    :location,
    :starts_on,
    :ends_on,
    :age,
    :header_image,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :description,
    :location,
    :starts_on,
    :ends_on,
    :age,
    :header_image,
  ]

  # Overwrite this method to customize how animes are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(anime)
  #   "Anime ##{anime.id}"
  # end
end
