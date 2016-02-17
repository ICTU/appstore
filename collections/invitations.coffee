@Invitations = new Mongo.Collection 'invitations'

Meteor.startup ->
  if Meteor.isServer
    Invitations.remove {}
    Invitations.insert {'code':'ThisIsSparta01'}
