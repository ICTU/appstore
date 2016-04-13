Meteor.publish 'appstore', -> AppStore.find {}, {sort: name: 1}

Meteor.publish 'thaUsers', ->
  loggedInUser = @userId
  if loggedInUser and Roles.userIsInRole(loggedInUser, ["admin"], Roles.GLOBAL_GROUP)
    Meteor.users.find {}
  else if loggedInUser
    console.log @userId
    Meteor.users.find { _id: @userId }
  else
    @stop()

Meteor.publish 'thaRoles', ->
  loggedInUser = @userId
  if loggedInUser and Roles.userIsInRole(loggedInUser, ['admin'], Roles.GLOBAL_GROUP)
    Roles.getAllRoles()
