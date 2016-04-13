AccountsTemplates.configure
  showForgotPasswordLink: false
  overrideLoginErrors: true
  enablePasswordChange: false
  negativeValidation: true
  positiveValidation: true
  negativeFeedback: false
  positiveFeedback: true
  forbidClientAccountCreation: true

AccountsTemplates.removeField 'email'
AccountsTemplates.removeField 'password'

AccountsTemplates.addFields [
  {
    _id: 'username'
    displayName: 'Username'
    type: 'text'
    required: true
    func: (username) ->
      if Meteor.isClient
        console.log 'Validating username'
        Meteor.call 'userExists', username, (err, res) =>
          if !res
            @setSuccess()
          else
            @setError res
          @setValidating false
  }
    _id: 'password'
    displayName: 'Password'
    type: 'password'
    required: true
    minLength: 6
  {
    _id: 'invitation'
    displayName: 'Invitation code'
    type: 'text'
    required: true
    func: (inviteCode) ->
      if Meteor.isClient
        Meteor.call 'validateInvitation', inviteCode, (err, res) =>
          console.error if err
          if res
            @setSuccess
          else
            @setError "Invitation code invalid"
        @setValidating false
  }
]

AccountsTemplates.configureRoute 'signIn'
