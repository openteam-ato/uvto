$ ->
  init_chart()             if $(".chart").length
  init_galleria()          if $("#galleria").length
  init_slider()            if $('#slider').length
  init_jcarousel()         if $(".banners_block").length
  init_map()               if $("#map").length
  init_tabs()              if $('.tabs').length
  init_upload_files()      if $('.appeal_form').length
  init_archive_collapser() if $('.archive').length
  if $(".need_collapser").length
    init_collapser()
    hash_handler()
  $('a.invalid_link').click =>
    return false
