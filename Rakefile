# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)

Restaurant::Application.load_tasks
 task :test do
  test_files = FileList['test/controllers/*_test.rb']
  test_files.each do|file|
    ruby "#{file}"
  end
end
	
