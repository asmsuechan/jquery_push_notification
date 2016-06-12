(($) ->
  default_options =
    'title' : "Notification"
    'closeTime' : 5000

  notify_methods =
    # create notification
    create_notification: (options) ->
      new Notification(options.title, options)

    # close notification 
    close_notification: (notification, options) ->
      setTimeout(notification.close.bind(notification), options.closeTime)

    set_default_icon: (icon_url) ->
      default_options.icon = icon_url

    #return true if NotificationAPI is supported in your browser
    isSupported: () ->
      if ("Notification" of window) and (Notification.permission isnt "denied")
        return true
      else
        return false

    permission_request: () ->
      if Notification.permission is "default"
        Notification.requestPermission

  $.extend

    notify: (body, arguments_options) ->
      throw "Notification: few arguments" if arguments.length < 1
      throw "Notification: body must 'String'" if typeof body != 'string'

      # merge default_options and arguments_options to options
      options = $.extend default_options, arguments_options

      if notify_methods.isSupported()
        notify_methods.permission_request()

        notification = notify_methods.create_notification(options)
        notify_methods.close_notification(notification, options)

        # **callback functions**
        # callback after notification is clicked
        click : (callback) ->
          notification.addEventListener 'click', ->
            callback()
          return this

        # callback after notification is shown 
        show : (callback) ->
          notification.addEventListener 'show', ->
            callback()
          return this

        # callback after notification is displaied 
        close: (callback) ->
          notification.addEventListener 'close', ->
            callback()
          return this

        # callback after notification raises errors 
        error : (callback) ->
          notification.addEventListener 'error', ->
            callback()
          return this
) jQuery
