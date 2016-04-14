Template['base-layout'].events
  'submit #formLogin': (e) ->
    e.preventDefault()
    username = e.target.username.value
    password = e.target.password.value
    Meteor.loginWithLDAP username, password, { searchBeforeBind: {'uid': username} }, (err, res) ->
      if err
        sAlert.error "Login failed: #{err.message}"
        throw new Meteor.Error err.code, err.message
      else
        sAlert.info "#{Meteor.user().username} logged in."
  'click #logOut': ->
    Meteor.logout()
    sAlert.info "#{Meteor.user().username} logged out."

Template['base-layout'].helpers
  appVersion: -> version
