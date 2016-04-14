if Meteor.isClient
  sAlert.config
    effect: 'slide'
    position: 'bottom-right'
    timeout: 5000
    html: true
    onRouteClose: false
    stack: true
    offset: 20
