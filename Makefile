dirs := $(wildcard exercises/practice/*)
all-tests := $(addprefix test-, $(notdir $(dirs)))

test: $(all-tests)

test-%:
	$(eval exercise := $(patsubst test-%, %, $@))
	@echo
	@ls ./exercises/practice/$(exercise)/.docs/instructions.md > /dev/null
	@# check stub type
	@cd ./exercises/practice/$(exercise) && \
		poly -q --use test | grep 'error: Type error' | \
		wc -l | xargs -I @ expr @ = 0 > /dev/null || \
		{ echo '$(exercise).sml is faulty'; exit 1; }
	@cd ./exercises/practice/$(exercise) && cat test.sml | sed 's/$(exercise).sml/.meta\/example.sml/' | poly -q
	@echo

redeploy-testlib:
	poly --script sml-bin/redeploy-testlib.sml

.PHONY: test
