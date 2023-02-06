.PHONY: install test clean

EMACS = emacs

install:
	@echo "Installing bootcamp-utilities.el..."
	@cp bootcamp-utilities.el ~/.emacs.d/

test:
	@echo "Running tests for bootcamp-utilities.el..."
	@emacs -batch -l ert -l bootcamp-utilities.el -f ert-run-tests-batch-and-exit output.log

clean:
	@echo "Cleaning up generated files..."
	@rm -f *~ output.log

deps:
	@./scripts/deps.sh

 
emacs-version:
	@emacs --version
