Meteor.startup ->

  LDAP_DEFAULTS.url = Meteor.settings?.ldap?.serverAddr || "ldap://ldap"
  LDAP_DEFAULTS.port = Meteor.settings?.ldap?.serverPort || "389"
  LDAP_DEFAULTS.base = Meteor.settings?.ldap?.baseDn || "dc=ictu,dc=nl"
  LDAP_DEFAULTS.superDn = Meteor.settings?.ldap?.superDn || ""
  LDAP_DEFAULTS.superPass = Meteor.settings?.ldap?.superPass || "123456"
  LDAP_DEFAULTS.searchResultsProfileMap = [
    {
      resultKey: "uid",
      profileProperty: "username"
    },
    {
      resultKey: "dn",
      profileProperty: "dn"
    },
    {
      resultKey: "mail"
      profileProperty: "email"
    }
  ]

  roles = ['admin', 'editor', 'viewer']
  for role in roles
   if Meteor.roles.find({name: role}).count() == 0
       Roles.createRole(role)

Meteor.methods
  getRolesForUser: (targetUser) ->
    loggedInUser = Meteor.user()
    if !loggedInUser or !Roles.userIsInRole(loggedInUser, ['admin'], Roles.GLOBAL_GROUP)
      throw new Meteor.error 403, 'Access denied'
    Roles.getRolesForUser targetUser
  updateRoles: (userId, roles) ->
    loggedInUser = Meteor.user()
    if !loggedInUser or !Roles.userIsInRole(loggedInUser, ['admin'], Roles.GLOBAL_GROUP)
      throw new Meteor.Error 403, 'Access denied'
    Roles.setUserRoles userId, roles, Roles.GLOBAL_GROUP
  addRole: (userId, role) ->
    loggedInUser = Meteor.user()
    if !loggedInUser or !Roles.userIsInRole(loggedInUser, ['admin'], Roles.GLOBAL_GROUP)
      throw new Meteor.Error 403, 'Access denied'
    Roles.addUsersToRoles userId, [role], Roles.GLOBAL_GROUP
