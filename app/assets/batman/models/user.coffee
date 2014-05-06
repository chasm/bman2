class Bman.User extends Batman.Model
  @resourceName: 'user'
  @storageKey: 'users'

  @persist Batman.RailsStorage

  # Use @encode to tell batman.js which properties Rails will send back with its JSON.
  @encode 'name', 'email'
  @encodeTimestamps()

  @validate "email", presence: true

  @hasMany 'posts',
    inverseOf: 'user'
    saveInline: false
