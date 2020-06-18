SimpleCov.start do
  coverage_dir "reports/coverage"

  add_filter "/config/"
  add_filter "/lib/tasks/"

  track_files "lib/**/*.rb"
end
