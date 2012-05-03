@init_upload_files = ->
  $(".upload_link").live "click", ->
    params = $(this).attr("params")
    target = "." + $(this).attr("id")
    $(this).slideUp()
    $(target).html($("<iframe/>",
      src: "/el_finder?" + params
      width: "580"
      height: "400"
      scrolling: "no"
      id: "el_finder_iframe"
    ).load ->
      $(".content_wrapper").animate
        scrollTop: $(document).height() + $(target).height()
    ).slideDown()
    false
