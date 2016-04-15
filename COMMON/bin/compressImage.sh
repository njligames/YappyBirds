ROOT_NAME="interface"
#ROOT_NAME="mytest"




INPUT_IMAGE_FOLDER="/Users/jamesfolk/NJLI/YappyBirds/COMMON/interface/TexturePacker"
OUTPUT_SHEET_FOLDER="/Users/jamesfolk/NJLI/YappyBirds/COMMON/assets/images"
OUTPUT_DATA_FOLDER="/Users/jamesfolk/NJLI/YappyBirds/COMMON/gameplay_scripts"

FORMAT="corona-imagesheet"
TEXTURE_FORMAT="pvr3"

#--flip-pvr 
TexturePacker --max-size 4096 --size-constraints POT --force-squared --multipack --disable-rotation --trim-mode None --opt PVRTC4 --pvr-quality best --force-publish --data ${OUTPUT_DATA_FOLDER}/${ROOT_NAME}{n}.lua --format ${FORMAT} --sheet ${OUTPUT_SHEET_FOLDER}/${ROOT_NAME}{n}.pvr --texture-format ${TEXTURE_FORMAT} ${INPUT_IMAGE_FOLDER}
