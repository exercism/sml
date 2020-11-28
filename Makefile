dirs := $(wildcard exercises/*)
all-tests := $(addprefix test-, $(notdir $(dirs)))

COMMIT_RANGE := HEAD
ifdef GITHUB_COMMIT_RANGE
COMMIT_RANGE := $(GITHUB_COMMIT_RANGE)
endif

test: $(all-tests)

debug:
	@echo ---------------
	@echo HEAD: $(shell git rev-list -1 HEAD)
	@echo master: $(shell git rev-list -1 origin/master 2> /dev/null)
	@echo COMMIT_RANGE: $(COMMIT_RANGE)
	@echo GITHUB_EVENT_NAME: $(GITHUB_EVENT_NAME)
	@echo GITHUB_SHA: $(GITHUB_SHA)
	@echo Modified/Added:
	@git diff-tree --name-status -r --no-commit-id --diff-filter=AM -M $(COMMIT_RANGE)
	@echo Renamed:
	@git diff-tree --name-status -r --no-commit-id --diff-filter=R -M $(COMMIT_RANGE)
	@echo ---------------

gha:
	@$(MAKE) -s debug
	$(eval tests := $(shell \
		git diff-tree --name-only -r --diff-filter=AM $(COMMIT_RANGE) | \
		perl -n -e '/exercises\/([a-z-_]+)\/.+\.sml/ && print "test-$$1\n"' | uniq))
	$(if $(tests), @echo Tests: $(tests), @echo 'Nothing to test.')
	$(if $(tests), @$(MAKE) -s $(tests))

test-%:
	$(eval exercise := $(patsubst test-%, %, $@))
	@echo
	@ls ./exercises/$(exercise)/README.md > /dev/null
	@# check stub type
	@cd ./exercises/$(exercise) && \
		poly -q --use test | grep 'error: Type error' | \
		wc -l | xargs -I @ expr @ = 0 > /dev/null || \
		{ echo '$(exercise).sml is faulty'; exit 1; }
	@cd ./exercises/$(exercise) && cat test.sml | sed 's/$(exercise).sml/example.sml/' | poly -q
	@echo

.PHONY: test
