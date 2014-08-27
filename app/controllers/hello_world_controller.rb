class HelloWorldController < ApplicationController
  def hello_world
    Pusher['theinstagramapp_channel'].trigger('new_upload', {
      message: 'hello world'
    })
  end
end