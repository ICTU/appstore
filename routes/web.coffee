Meteor.startup ->
  adminFilter = ->
    if Meteor.logginIn
      @render 'loading'

  Router.configure
    layoutTemplate: 'base-layout'

  Router.map ->
    @route 'appstore',
      path: '/'
      subscriptions: -> Meteor.subscribe 'appstore'
    @route 'config',
      # before: adminFilter
      template: 'config'
      path: '/config'
      subscriptions: -> [
        Meteor.subscribe 'thaRoles',
        Meteor.subscribe 'thaUsers'
      ]
