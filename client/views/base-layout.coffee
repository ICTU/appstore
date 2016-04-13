Template['base-layout'].events
  'submit #formLogin': (e) ->
    e.preventDefault()
    username = e.target.username.value
    password = e.target.password.value
    Meteor.loginWithLDAP username, password, { searchBeforeBind: {'uid': username} }, (err, res) ->
      if err
        sAlert.error "Login failed: #{err.message}"
        # Bert.alert "Login failed #{err.message}", "danger"
        throw new Meteor.Error err.code, err.message
      else
        sAlert.info "#{Meteor.user().username} logged in."
        # Bert.alert "#{Meteor.user().username} logged in.", "info"
  'click #logOut': ->
    Meteor.logout()
    sAlert.info "#{Meteor.user().username} logged out."
    # Bert.alert "#{Meteor.user().username} logged out.", "info"


Template['base-layout'].helpers
  appVersion: -> version
