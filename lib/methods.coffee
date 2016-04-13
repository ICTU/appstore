Meteor.methods
  saveApp: (parsed, raw) ->
    loggedInUser = Meteor.user()
    if !loggedInUser
      throw new Meteor.Error(403, "Access denied")
    AppStore.upsert {name: parsed.name, version: parsed.version}, _.extend(parsed, def: raw)
  deleteApp: (name, version) ->
    loggedInUser = Meteor.user()
    if !loggedInUser
      throw new Meteor.Error(403, "Access denied")
    AppStore.remove name: name, version: version
  validateInvitation: (inviteCode) ->
    Invitations.findOne {"code":"#{inviteCode}"}
