require 'active_support/inflector'

class Sinatra < Thor::Group
  include Thor::Actions

  argument :name

  def self.source_root
    File.dirname(__FILE__)
  end

  def create_directory
    directory('templates/sinatra', name)
  end

  def bundle_install
    inside(name) do
      run 'bundle install' 
    end
  end

  def git_setup 
    inside(name) do
      run 'git init' 
      run 'git add .' 
      run 'git commit -am "initial commit"'
    end
  end

  def done
    say "#{name} created successfully.", :green
  end
end
