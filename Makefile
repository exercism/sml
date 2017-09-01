dirs := $(wildcard exercises/*)
all-tests := $(addprefix test-, $(notdir $(dirs)))

COMMIT_RANGE := HEAD
ifdef TRAVIS_PULL_REQUEST
ifneq ($(TRAVIS_PULL_REQUEST), false)
COMMIT_RANGE := master..HEAD
endif
endif

test: $(all-tests)

debug:
	@echo ---------------
	@echo HEAD: $(shell git rev-list -1 HEAD)
	@echo master: $(shell git rev-list -1 master 2> /dev/null)
	@echo COMMIT_RANGE: $(COMMIT_RANGE)
	@echo TRAVIS_COMMIT_RANGE: $(TRAVIS_COMMIT_RANGE)
	@echo TRAVIS_PULL_REQUEST: $(TRAVIS_PULL_REQUEST)
	@echo TRAVIS_COMMIT: $(TRAVIS_COMMIT)
	@echo Modified/Added:
	@git diff-tree --name-status -r --no-commit-id --diff-filter=AM -M $(COMMIT_RANGE)
	@echo Renamed:
	@git diff-tree --name-status -r --no-commit-id --diff-filter=R -M $(COMMIT_RANGE)
	@echo ---------------

travis:
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
