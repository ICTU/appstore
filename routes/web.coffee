Meteor.startup ->
  Router.configure
    layoutTemplate: 'base-layout'

  # Router.plugin 'ensureSignedIn', {
  #   except: ['index']
  # }

  Router.map ->
    @route 'appstore',
      path: '/'
      subscriptions: -> Meteor.subscribe 'appstore'
