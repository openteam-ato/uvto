@init_archive_collapser = ->
  $('.year', '.archive').click ->
    $this = $(this)

    return false if $this.hasClass('busy')

    $this.addClass('busy').toggleClass('active').next('ul').slideToggle 'slow', ->
      $this.removeClass('busy')

    return false
