PACKAGE	:= xorgconf-mouse
VERSION	:= 0.1
AUTHOR	:= R.Jaksa 2024 GPLv3

CFG0	:= $(shell find xorg.conf.d -type f | grep -v -F .bkp)
CFG	:= $(CFG0:%=/usr/share/X11/%)

all:

LS	:= ls -l --no-group --time-style '+ %Y-%m-%d %H:%M '
install: $(CFG)
	@echo
	@$(LS) ./$(CFG0)
	@echo /usr/share/X11/xorg.conf.d:
	@$(LS) /usr/share/X11/xorg.conf.d | grep -v total
	@echo

$(CFG): /usr/share/X11/%: %
	install -D -m 644 $* $@

-include ~/.github/Makefile.git
