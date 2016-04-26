OBJECTS = ../assets/images/interface*.png

all: $(OBJECTS)

#$(OBJECTS):./TexturePacker/*/*.png
#	@echo target is $@, source is $^

$(OBJECTS):./TexturePacker/*/*.png
	../bin/packImages.sh interface Trim

clean:
	rm $(OBJECTS)
