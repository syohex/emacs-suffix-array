.PHONY : test

EMACS ?= emacs

LOADPATH = -L .

test:
	$(CASK) exec $(EMACS) -Q -batch $(LOADPATH) \
		-l test/suffix-array-test.el \
		-f ert-run-tests-batch-and-exit
