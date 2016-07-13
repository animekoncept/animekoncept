require "administrate/base_dashboard"

class AnimeDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    genres: Field::HasMany,
    producers: Field::HasMany,
    id: Field::Number,
    title: Field::String,
    synopsis: Field::Text,
    aired_on: Field::DateTime,
    ended_on: Field::DateTime,
    duration: Field::String,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    slug: Field::String,
    cover_image: PaperclipField,
    header_image: PaperclipField,
    crunchyroll: Field::String,
    official_site: Field::String,
    wiki: Field::String,
    type_of: Field::String,
    mal_id: Field::Number,
    season: Field::BelongsTo,
  }

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :genres,
    :producers,
    :id,
    :title,
    :synopsis,
    :cover_image,
    :header_image,
    :crunchyroll,
    :official_site,
    :wiki,
    :type_of,
    :mal_id,
    :season,
  ]

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = ATTRIBUTE_TYPES.keys

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :genres,
    :producers,
    :title,
    :synopsis,
    :aired_on,
    :ended_on,
    :duration,
    :slug,
    :season_id,
    :cover_image,
    :header_image,
    :crunchyroll,
    :official_site,
    :wiki,
    :type_of,
    :mal_id,
    :season,
  ]

  # Overwrite this method to customize how animes are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(anime)
  #   "Anime ##{anime.id}"
  # end
end
