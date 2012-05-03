@init_galleria = ->
  $('#galleria').galleria({
    width: 940,
    imageCrop: 'height',
    thumbCrop: true,
    transitionSpeed: 500,
    preload: 3,
    easing: "galleriaIn",
    showCounter: false,
    transition: "fade",
    transitionInitial: "fade",
    showInfo: true,
    showFullscreen: true
  })

@init_slider = ->
  $('#slider').galleria({
    autoplay: 10000,
    easing: "galleriaIn",
    height: 348,
    imageCrop: true,
    preload: 3,
    showCounter: false,
    showImagenav: false,
    showFullscreen: false,
    showInfo: true,
    thumbCrop: false,
    thumbnails: false,
    transition: "fade",
    transitionInitial: "fade",
    transitionSpeed: 500,
    width: 618
    extend: (e) ->
      galleria_instance = this
      @bind "loadfinish", (e) ->
        draw_dot_navigation(galleria_instance)
  })

draw_dot_navigation = (galleria) ->
  info_block = $('.galleria-info')
  unless $('.dots').length
    info_block.append('<div class="dots"></div>')
    dots_block = $('.dots')
    image_count = galleria.getDataLength()
    i = 0
    while i < image_count
      dots_block.append('<span id="dot'+i+'"></span>')
      i++
    $('.dots').click (event) ->
      $this = $(event.target)
      return false if $this.hasClass('active') || !$this.is('span')
      galleria.playToggle()
      $('.dots, .active').removeClass('active')
      $this.addClass('active')
      target_index = $this.attr('id').replace('dot','')
      galleria.show(target_index)
      galleria.playToggle()

  $('.active','.dots').removeClass('active')
  $("#dot"+galleria.getIndex()).addClass('active')


