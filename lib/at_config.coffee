AccountsTemplates.configure
  showForgotPasswordLink: false
  overrideLoginErrors: true
  enablePasswordChange: false
  negativeValidation: true
  positiveValidation: true
  negativeFeedback: false
  positiveFeedback: true

AccountsTemplates.addField
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

AccountsTemplates.configureRoute 'signIn'
