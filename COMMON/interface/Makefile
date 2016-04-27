OBJECTS = ../assets/images/interface*.png

all: $(OBJECTS)

#None       
#Trim       
#Crop       
#CropKeepPos
#Polygon    

$(OBJECTS):./TexturePacker/*/*.png
	../bin/packImages.sh interface Trim

clean:
	rm -f $(OBJECTS)
