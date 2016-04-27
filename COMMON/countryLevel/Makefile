
SCRIPTDIR = ../gameplay_scripts/levels/country
SCRIPTS = $(addprefix $(SCRIPTDIR)/, $(patsubst %.tmx, %.lua, $(wildcard *.tmx)))
IMAGE_OBJECTS = ../assets/images/countryLevel*.png

.PHONY: all clean

all: $(SCRIPTDIR) scripts $(IMAGE_OBJECTS)

$(SCRIPTDIR):
	mkdir -p $(SCRIPTDIR)

$(SCRIPTDIR)/%.lua: %.tmx
	/Applications/Tiled.app/Contents/MacOS/Tiled --export-map $< $@

scripts: $(SCRIPTS)

$(IMAGE_OBJECTS):./TexturePacker/*/*.png
	../bin/packImages.sh countryLevel None

clean:
	rm -f scripts $(wildcard *.lua)
	rm -rf $(SCRIPTDIR)
	rm -f $(IMAGE_OBJECTS)
