class ConsolesController < ApplicationController

  # GET: /consoles
  get "/consoles" do
    erb :"/consoles/index.html"
  end

  # GET: /consoles/new
  get "/consoles/new" do
    erb :"/consoles/new.html"
  end

  # POST: /consoles
  post "/consoles" do
    redirect "/consoles"
  end

  # GET: /consoles/5
  get "/consoles/:id" do
    erb :"/consoles/show.html"
  end

  # GET: /consoles/5/edit
  get "/consoles/:id/edit" do
    erb :"/consoles/edit.html"
  end

  # PATCH: /consoles/5
  patch "/consoles/:id" do
    redirect "/consoles/:id"
  end

  # DELETE: /consoles/5/delete
  delete "/consoles/:id/delete" do
    redirect "/consoles"
  end
end
