--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:e0437942b1fc128062f263bfdee47546:8ee25a7d5dd14f285d5459ef41f997c2:f7b104b5caf7d2895de2181e87a70fad$
--
-- local sheetInfo = require("mysheet")
-- local myImageSheet = graphics.newImageSheet( "mysheet.png", sheetInfo:getSheet() )
-- local sprite = display.newSprite( myImageSheet , {frames={sheetInfo:getFrameIndex("sprite")}} )
--

local SheetInfo = {}

SheetInfo.sheet =
{
    frames = {
    
        {
            -- 128cloud00
            x=103,
            y=1873,
            width=130,
            height=107,
	        widthFile=130,
	        heightFile=107,
            pivotx=0,
            pivoty=105,
            
            trimmedName = "128cloud00"
        },
        {
            -- 128tree00
            x=0,
            y=1873,
            width=103,
            height=130,
	        widthFile=103,
	        heightFile=130,
            pivotx=0,
            pivoty=128,
            
            trimmedName = "128tree00"
        },
        {
            -- 2048hills00
            x=0,
            y=979,
            width=2050,
            height=378,
	        widthFile=2050,
	        heightFile=378,
            pivotx=0,
            pivoty=376,
            
            trimmedName = "2048hills00"
        },
        {
            -- 2048hills01
            x=0,
            y=514,
            width=2050,
            height=465,
	        widthFile=2050,
	        heightFile=465,
            pivotx=0,
            pivoty=463,
            
            trimmedName = "2048hills01"
        },
        {
            -- 2048hills02
            x=456,
            y=0,
            width=2050,
            height=425,
	        widthFile=2050,
	        heightFile=425,
            pivotx=0,
            pivoty=423,
            
            trimmedName = "2048hills02"
        },
        {
            -- 256cloud00
            x=235,
            y=1615,
            width=258,
            height=211,
	        widthFile=258,
	        heightFile=211,
            pivotx=0,
            pivoty=209,
            
            trimmedName = "256cloud00"
        },
        {
            -- 256house00
            x=0,
            y=1615,
            width=235,
            height=258,
	        widthFile=235,
	        heightFile=258,
            pivotx=0,
            pivoty=256,
            
            trimmedName = "256house00"
        },
        {
            -- 256tree00
            x=0,
            y=1357,
            width=239,
            height=258,
	        widthFile=239,
	        heightFile=258,
            pivotx=0,
            pivoty=256,
            
            trimmedName = "256tree00"
        },
        {
            -- 512tree00
            x=0,
            y=0,
            width=456,
            height=514,
	        widthFile=456,
	        heightFile=514,
            pivotx=0,
            pivoty=512,
            
            trimmedName = "512tree00"
        },
        {
            -- 8x8
            x=456,
            y=425,
            width=34,
            height=34,
	        widthFile=34,
	        heightFile=34,
            pivotx=0,
            pivoty=32,
            
            trimmedName = "8x8"
        },
    },
    fileName = "images/tilesheet_background_country0.png",
    sheetContentWidth = 4096,
    sheetContentHeight = 2048,
    scale = 1,
    shapePadding = 0,
    borderPadding = 0,
    commonDivisorX = 1,
    commonDivisorY = 1,
    extrude = 0,
    baseFactor = 1,
    maxTextureSizeWidth = 4096,
    maxTextureSizeHeight = 4096,
    fixedTextureSizeWidth = -1,
    fixedTextureSizeHeight = -1
}

SheetInfo.frameIndex =
{

    ["128cloud00"] = 1,
    ["128tree00"] = 2,
    ["2048hills00"] = 3,
    ["2048hills01"] = 4,
    ["2048hills02"] = 5,
    ["256cloud00"] = 6,
    ["256house00"] = 7,
    ["256tree00"] = 8,
    ["512tree00"] = 9,
    ["8x8"] = 10,
}

function SheetInfo:getSheet()
    return self.sheet;
end

function SheetInfo:getFrameIndex(name)
    return self.frameIndex[name];
end

return SheetInfo
