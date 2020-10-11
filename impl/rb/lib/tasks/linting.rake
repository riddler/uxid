begin
  require "rubocop/rake_task"

  desc "Run Linting (RuboCop)"
  task linting: "linting:dev"

  namespace :linting do
    common_options = %w[ --display-cop-names --extra-details --config=.rubocop.yml --parallel ]

    RuboCop::RakeTask.new :dev do |t|
      t.options = common_options
    end

    RuboCop::RakeTask.new :report do |t|
      t.options = common_options + %w[ --format=html --out=reports/linting/index.html ]
    end
  end
rescue LoadError
end
