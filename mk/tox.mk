############################################################################
## Tests run using tox
############################################################################

#***********************************
### flake8, bandit
#***********************************
.PHONY : lint
lint: bugvault collectors apps check-testenv
	@echo ">running lint"
	$(tox) -e flake8,bandit



#***********************************
### Static typecheck with mypy
#***********************************
.PHONY : typecheck
typecheck: bugvault collectors apps check-testenv
	@echo ">running mypy"
	$(tox) -e mypy


#***********************************
### Autoformat with black
#***********************************
.PHONY : format
format: bugvault collectors apps check-testenv
	@echo ">running formatting"
	$(tox) -e black


#***********************************
### tox test
#***********************************
.PHONY : test
test: testunit
testunit: bugvault collectors apps check-testenv
	$(tox) -e bugvault


#***********************************
### tox checkin
#***********************************
.PHONY : checkin
checkin: check-testenv
	@echo ">running check"
	$(tox)

all: checkin
