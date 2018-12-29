# 客户端,处理收到广播数据
# PS: 1、需要格式对齐
#     2、语法错误，浏览器中可看到
App.room = App.cable.subscriptions.create "RoomChannel",
  # 这里方法都是回调
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # 两种写法 data.xx / data['xx']

    alert("You have a new mention") if data['mention']
    alert("object message") if data.object_message
    if (data.message && !data.message.blank?)
      $('#messages-table').append data.message
      scroll_bottom()


# 可以放 普通js 代码
submit_message = () ->
  $('#message_content').on 'keydown', (event) ->
    if event.keyCode is 13 && !event.shiftKey    # 按下enter 但 没有按shift
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