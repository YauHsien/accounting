.PHONY: all
## This make file exploits SWI-Prolog.
all:
	swipl -f "account items.prolog" -g "convert,halt."
out:
	swipl -f "account items.prolog" -g "convert,halt." > "account items.sql"
