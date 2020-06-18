# Your Makefiles are wrong: https://tech.davis-hansson.com/p/make/
# Self Documented Makefile: https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
# Bash strict mode: http://redsymbol.net/articles/unofficial-bash-strict-mode/

SHELL := bash
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c
.DELETE_ON_ERROR:
MAKEFLAGS += --warn-undefined-variables
MAKEFLAGS += --no-builtin-rules
HELP_TASK_WIDTH := 20

ifeq ($(origin .RECIPEPREFIX), undefined)
  $(error This Make does not support .RECIPEPREFIX. Please use GNU Make 4.0 or later)
endif
.RECIPEPREFIX = >

.DEFAULT_GOAL := help

help: ## Displays help message describing each task
> @printf "\n%s\n\n" "UXID Spec Make Tasks"
> @grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-${HELP_TASK_WIDTH}s\033[0m %s\n", $$1, $$2}'
# Don't look for this on the filesystem
.PHONY: help

generate: generated/.ex generated/.py generated/.rb generated/.ts ## Generate all specs
> @echo "Done!"
# Don't look for this on the filesystem 
.PHONY: generate

generated/.ex: generated/
> @mix run generate.exs ex $@

generated/.py: generated/
> @mix run generate.exs py $@

generated/.rb: generated/
> @mix run generate.exs rb $@

generated/.ts: generated/
> @mix run generate.exs ts $@

generated/:
> @mkdir -p generated

# w3c/.manifest: w3c/manifest.xml w3c_manifest.exs
# > @mix run w3c_manifest.exs w3c/manifest.xml $@ $(W3C_SUITE)

clean: ## Cleanup (remove) all generated files.
> @rm -rf generated
