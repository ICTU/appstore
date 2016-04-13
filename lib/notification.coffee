if Meteor.isClient
  sAlert.config {
    effect: 'slide'
    position: 'bottom-right'
    timeout: 5000
    html: true
    onRouteClose: false
    stack: true
    offset: 20
  }

  Bert.defaults = {
    hideDelay: 5000,
    style: 'growl-bottom-right',
    type: 'default'
  }
