
OBJECTS = ../assets/images/countryLevel*.png

all: $(OBJECTS)

#$(OBJECTS):./TexturePacker/*/*.png
#	@echo target is $@, source is $^

$(OBJECTS):./TexturePacker/*/*.png
	../bin/packImages.sh countryLevel None

clean:
	rm $(OBJECTS)