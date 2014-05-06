class Bman.UsersController extends Batman.Controller
  routingKey: 'users'

  index: (params) ->
    @set 'users', Bman.User.get('all')


  show: (params) ->
    Bman.User.find parseInt(params.id, 10), (err,result) =>
      throw err if err
      @set 'user', result

    # @render source: 'users/show'

  new: (params) ->
    @set 'user', new Bman.User()
    @form = @render()

  create: (params) ->
    @get('user').save (err) =>
      $('#new_user').attr('disabled', false)

      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        Bman.flashSuccess "#{@get('user.name')} created successfully!"
        @redirect '/users'

  edit: (params) ->
    @set 'user', Bman.User.find parseInt(params.id, 10), (err) ->
      throw err if err
    @form = @render()

  update: (params) ->
    @get('user').save (err) =>
      $('#edit_user').attr('disabled', false)

      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        Bman.flashSuccess "#{@get('user.name')} updated successfully!"
        @redirect '/users'

  # not routable, an event
  destroy: ->
    @get('user').destroy (err) =>
      if err
        throw err unless err instanceof Batman.ErrorsSet
      else
        Bman.flashSuccess "Removed successfully!"
        @redirect '/users'
