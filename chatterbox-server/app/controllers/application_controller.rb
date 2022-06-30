class ApplicationController < Sinatra::Base
  set :default_content_type, "application/json"

  get "/messages" do
    messages = Message.all.order(:create_at)
    messages.to_json
  end

  post "/messages/post" do
    message = Message.create(
      body: params[:body],
      username: params[:username],
    )
    message.to_json
  end

  patch "/messages/patch/:id" do
    message = Message.find(params[:id])
    message.update(body: params[:body])
    message.to_json
  end

  delete "/messages/delete/:id" do
    message = Message.find(params[:id])
    message.destroy
    message.to_json
  end
end
