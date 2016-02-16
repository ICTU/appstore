Template.appstore.helpers
  apps: -> AppStore?.find()
  hash: -> CryptoJS.MD5 "#{@name}#{@version}"

Template.appstore.events
  "click .btn-remove-app": (event, template) ->
    Meteor.call 'deleteApp', @name, @version
  'save-app-def': (e, tpl) ->
    Meteor.call 'saveApp', e.yaml.parsed, e.yaml.raw
