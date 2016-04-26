all: 
	mkdir -p ./assets
	mkdir -p ./assets/cameras
	mkdir -p ./assets/curves
	mkdir -p ./assets/fonts
	mkdir -p ./assets/images
	mkdir -p ./assets/materials
	mkdir -p ./assets/meshes
	mkdir -p ./assets/particles
	mkdir -p ./assets/scripts
	mkdir -p ./assets/shaders
	mkdir -p ./assets/sounds
	mkdir -p ./assets/strings
	cd ./countryLevel && make
	cd ./gameplay && make
	cd ./interface && make
	cd ./gameplay_scripts && make
	cd ./audio && make

clean: 
	cd ./countryLevel && make clean
	rm -rf ./assets/cameras
	rm -rf ./assets/curves
	rm -rf ./assets/images
	rm -rf ./assets/materials
	rm -rf ./assets/meshes
	rm -rf ./assets/scripts
	rm -rf ./assets/sounds
