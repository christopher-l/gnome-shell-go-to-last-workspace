VSN=$(shell cat metadata.json | jq '.version')
PKG=$(shell basename $(PWD))
DEST=../$(PKG)-$(VSN).zip

release:
	rm -f ../$(DEST)
	glib-compile-schemas schemas
	zip -r $(DEST) *.json *.js schemas
	@git archive --format=zip -o $(DEST) master
	@echo "Written $(DEST)"
