SRCs=$(wildcard tests/*.as)
SWFs=$(SRCs:.as=.swf)

compile: flexsdk $(SWFs)

%.swf: %.as
	@ echo "- $<" && \
		$(MXMLC) -output=$@ \
		-library-path+=$(SDK)/frameworks \
		-define=CONFIG::Debug,false -define+=CONFIG::Release,true -debug=false \
		-strict -optimize -warnings -static-link-runtime-shared-libraries\
		$< 1>/dev/null &&\
		echo '  - $@'

clean:
	@ rm -rf tests/*.swf

# look for .FLEX_HOME if not found then use the FLEX_HOME enviornment variable
SDK := $(shell if [ -f .FLEX_HOME ]; then head -1 .FLEX_HOME; fi)
ifeq ($(SDK),)
	SDK := $(FLEX_HOME)
endif
export FLEX_HOME := $(SDK)

flexsdk:
ifeq ($(SDK),)
	@ echo "\nFlex SDK not found: \n\
	 - either define a FLEX_HOME enviornment variable \n\
	 - or a .FLEX_HOME file in the project home directory.\n"
	@ exit 1
endif

MXMLC=$(SDK)/bin/mxmlc

.PHONY: tests bin