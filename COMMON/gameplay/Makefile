
OBJECTS = ../assets/images/gameplay*.png

all: $(OBJECTS)

$(OBJECTS):./TexturePacker/*/*.png
	../bin/packImages.sh gameplay None

clean:
	rm $(OBJECTS)
