@init_tabs = ->
  tabs_wrapper = $('.tabs')
  tabs_items   = tabs_wrapper.children('li')

  tabs_wrapper.children('li').each (index, item) ->
    $('.'+$(item).attr('id')).addClass('tab_item').hide()

  tabs_wrapper.click (event) ->
    $this = $(event.target)
    return false if $this.hasClass('active')
    $this.siblings().removeClass('active')
    $this.toggleClass('active')

    if $this.parent().siblings('.tab_item').length
      $this.parent().siblings('.tab_item, .item_list .tab_item').slideUp()
    else
      $this.parent().parent().siblings('.item_list').children('.tab_item').slideUp()

    if $this.parent().siblings('.'+$this.attr('id')).length
      $this.parent().siblings('.'+$this.attr('id')).slideDown()
    else
      $('.viewport .overview').each (index, item) ->
        $item = $(item)
        width = $item.children('li').size()*$item.children('li').first().width()
        $item.css('width', width)
      $this.parent().parent().siblings('.item_list').children('.'+$this.attr('id')).slideDown().tinyscrollbar({ axis: 'x', wheel: '9' })

  tabs_wrapper.children('li').each (index, item) ->
    unless $('.calendar_items .'+$(item).attr('id')+' li:first').hasClass('empty')
      $(item).click()
      return false
