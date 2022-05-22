require 'sinatra'
require 'sinatra/reloader'
require './lib/project'
require './lib/volunteer'
require 'pry'
require 'pg'
require('./db_access.rb')
also_reload 'lib/**/*.rb'


get("/") do
  @projects = Project.all()
  erb(:index)
end

post("/") do
  title = params.fetch("title")
  new_project = Project.new({:title => title, :id => nil})
  new_project.save
  redirect "/"
end

get("/projects/:id") do
  @project_id = params[:id]
  @project = Project.find(params[:id])
  @volunteers = @project.volunteers()
  erb(:project)
end

get("/projects/:id/edit") do
  @project_id = params[:id]
  @project = Project.find(params[:id])
  erb(:projects)
end

post "/projects/:id/volunteers" do
  project_id = params[:id]
  @project = Project.find(params[:id])
  name = params["name"]
  volunteer = Volunteer.new(:project_id => @project.id, :name => name)
  volunteer.save
  redirect "/projects/#{@project.id}"
end

patch("/projects/:id/edit") do
  project = Project.find(params[:id])
  title = params.fetch("title")
  project.update({:title => title})
  redirect "/"
end

delete "/projects/:id/edit" do
  project = Project.find(params[:id])
  project.delete
  redirect "/"
end

get "/volunteer/:id" do
  @volunteer = Volunteer.find(params[:id])
  erb :volunteer
end

patch("/volunteer/:id/edit") do
  name = params["name"]
  @volunteer = Volunteer.find(params["id"].to_i)
  @volunteer.update({:name => name})
  redirect "/volunteer/#{@volunteer.id}"
end