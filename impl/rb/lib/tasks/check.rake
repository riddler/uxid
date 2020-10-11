desc "Runs tests, linting, audits, ..."
task check: %w[ test linting:dev metrics:quality ]
