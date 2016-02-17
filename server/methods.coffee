Meteor.methods
  saveApp: (parsed, raw) ->
    AppStore.upsert {name: parsed.name, version: parsed.version}, _.extend(parsed, def: raw)
  deleteApp: (name, version) ->
    AppStore.remove name: name, version: version
  validateInvitation: (inviteCode) ->
    Invitations.findOne {"code":"#{inviteCode}"}
