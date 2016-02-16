Meteor.publish 'appstore', -> AppStore.find {}, {sort: name: 1}
