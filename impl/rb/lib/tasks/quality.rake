begin
  require "rubycritic/rake_task"

  namespace :metrics do
    RubyCritic::RakeTask.new do |task|
      task.name = "quality"
      task.paths   = FileList["lib/**/*.rb"]
      task.options = "--format html --no-browser --path reports/quality"
    end
  end
rescue LoadError
end
