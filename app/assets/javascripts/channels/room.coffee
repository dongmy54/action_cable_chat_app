# 此文件要求 对齐哈
# 这里出现语法错误 浏览器端仍可看到
App.room = App.cable.subscriptions.create "RoomChannel",
  # 这里的方法也是 回调
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # data 是 broadcast hash
    unless data.message.blank?
      $('#messages-table').append data.message
      scroll_bottom()


# 在这里不光可以放 cable 的代码 还可以放置其它js 代码
# event 这里是 事件发生的对象
submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13
      # event.target.value 层叠结构哈
      console.log(event)
      $('input').click()
      event.target.value = ""           # 都不用分号结束
      event.preventDefault()

$(document).on 'turbolinks:load', ->
  submit_message()

scroll_bottom = () ->
  scroll_height = $("#messages")[0].scrollHeight
  $("#messages").scrollTop(scroll_height)