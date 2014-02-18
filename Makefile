DIG_VERSION=9.9.5-W1
DIG_NAME=BIND$(DIG_VERSION)
DIG_HOME=vendor/$(DIG_NAME)
DIG_ZIP=$(DIG_HOME)/$(DIG_NAME).zip

ISCC?= '/c/Program Files (x86)/Inno Setup 5/ISCC.exe'

all: setup

setup: vendor 
	$(ISCC) dig.iss $(ISCCOPT)

vendor: $(DIG_ZIP)

$(DIG_ZIP): .dig-zip-cookie

.dig-zip-cookie:
	@mkdir -p $(DIG_HOME)
	wget -O $(DIG_HOME).zip ftp://ftp.isc.org/isc/bind9/$(DIG_VERSION)/$(DIG_NAME).zip
	unzip -d $(DIG_HOME) $(DIG_HOME).zip
	touch .dig-zip-cookie

clean:
	rm -rf $(DIG_HOME){,.zip}
	rm -f .dig-zip-cookie

.PHONY: all setup vendor clean
