AccountsTemplates.configure
  showForgotPasswordLink: false
  overrideLoginErrors: true
  enablePasswordChange: false
  negativeValidation: true
  positiveValidation: true
  negativeFeedback: false
  positiveFeedback: true

AccountsTemplates.addField
  _id: 'signUpKey'
  type: 'password'
  required: true
  re: /^TopSecret01$/
  errStr: 'Incorrect signUpKey specified!'

AccountsTemplates.configureRoute 'signIn'
