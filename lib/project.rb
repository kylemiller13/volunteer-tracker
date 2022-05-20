class Project
  attr_reader :id
  attr_accessor :title

  def initialize(attributes)
    @title = attributes[:title]
    @id = attributes[:id]
  end

  def save 
    saved_project = DB.exec("INSERT INTO projects (title) VALUES ('#{@title}') RETURNING id;")
    @id = saved_project.first.fetch("id").to_i
  end

  def ==(another_project)
    self.title().==(another_project.title()).&(self.id().==(another_project.id()))
  end

  def self.all
    returned_projects = DB.exec("SELECT * from projects;")
    projects = []
    returned_projects.each() do |project|
      title = project.fetch("title")
      id = project.fetch("id").to_i
      projects.push(Project.new({:title => title, :id => id}))
    end
    projects
  end

  def self.find(id)
    found_projects = DB.exec("SELECT * FROM projects WHERE id = #{id};")
    title = found_projects.first.fetch("title")
    Project.new({:title => title, :id => id})
  end

  def update(attributes)
    @title = attributes.fetch(:title, @title)
    DB.exec("UPDATE projects SET title = '#{title}' WHERE id = '#{self.id()}';")
  end

  def delete
    DB.exec("DELETE FROM projects WHERE id = #{self.id};")
    DB.exec("DELETE FROM volunteers WHERE project_id = #{self.id()};")
  end

  def volunteers
    volunteers_in_project = DB.exec("SELECT * FROM volunteers WHERE project_id = #{self.id()};")
      project_volunteers = []
      volunteers_in_project.each() do |volunteer|
      id = volunteer.fetch('id').to_i()
      name = volunteer.fetch('name')
      project_id = self.id().to_i()
      project_volunteers.push(Volunteer.new({:id => id, :name => name, :project_id => project_id}))
    end
    project_volunteers
  end





end

