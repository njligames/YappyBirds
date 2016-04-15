ROOT_NAME="interface"
#ROOT_NAME="mytest"




INPUT_IMAGE_FOLDER="/Users/jamesfolk/NJLI/YappyBirds/COMMON/interface/TexturePacker"
OUTPUT_SHEET_FOLDER="/Users/jamesfolk/NJLI/YappyBirds/COMMON/assets/images"
OUTPUT_DATA_FOLDER="/Users/jamesfolk/NJLI/YappyBirds/COMMON/gameplay_scripts"

FORMAT="corona-imagesheet"
TEXTURE_FORMAT="png"

#--flip-pvr 
TexturePacker --mipmap-min-size 1 --max-size 4096 --size-constraints POT --force-squared --multipack --disable-rotation --trim-mode None --force-publish --data ${OUTPUT_DATA_FOLDER}/${ROOT_NAME}{n}.lua --format ${FORMAT} --sheet ${OUTPUT_SHEET_FOLDER}/${ROOT_NAME}{n}.png --texture-format ${TEXTURE_FORMAT} ${INPUT_IMAGE_FOLDER}

PVRTexToolCLI -i ${OUTPUT_SHEET_FOLDER}/${ROOT_NAME}0.png -m -f pvrtc1_4 -o ${OUTPUT_SHEET_FOLDER}/${ROOT_NAME}0.pvr
