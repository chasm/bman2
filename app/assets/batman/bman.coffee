#= require batman/es5-shim

#= require batman/batman
#= require batman/batman.rails

#= require jquery
#= require batman/batman.jquery

#= require_self

#= require_tree ./lib
#= require_tree ./controllers
#= require_tree ./models
#= require_tree ./views

Batman.config.pathToHTML = '/assets/html'

class Bman extends Batman.App

  @title = "Batblog"

  @resources 'users'

  @resources 'articles', ->
    @resources 'comments'

  @root 'main#index'

(global ? window).Bman = Bman
