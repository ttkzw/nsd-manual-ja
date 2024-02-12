UPSTREAM_URL    = https://github.com/NLnetLabs/nsd-manual.git
LOCALE_DIR      = nsd-manual/locales/ja/LC_MESSAGES
OMEGAT_SOURCE   = omegat/source
OMEGAT_TARGET   = omegat/target
HTML_DIR        = html

.PHONY: prepare
prepare: nsd-manual build-sphinx

nsd-manual:
	git clone $(UPSTREAM_URL)

.PHONY: build-sphinx
build-sphinx:
	docker build -t sphinx:latest .

.PHONY: pull
pull: nsd-manual
	cd nsd-manual && git pull $(UPSTREAM_URL)
	sed -i '.orig' "s/^language = None/language = 'ja'/" nsd-manual/source/conf.py
	docker run --rm -v `pwd`/nsd-manual:/doc sphinx bash -c "make gettext; sphinx-intl update -p build/gettext -l ja"
	cp $(LOCALE_DIR)/*.po $(OMEGAT_SOURCE)/

.PHONY: push
push:
	cp $(OMEGAT_TARGET)/*.po $(LOCALE_DIR)/
	docker run --rm -v `pwd`/nsd-manual:/doc sphinx make -e SPHINXOPTS="-D language=ja" html
	cp -Rp nsd-manual/build/html html

