--
-- created with TexturePacker (http://www.codeandweb.com/texturepacker)
--
-- $TexturePacker:SmartUpdate:92c9314092821f06a4dbcfe7e0550bf8:9c5ac296281316878b87e145e622b906:1fa06b4f5c6be9dedfd14bd871c8d785$
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
            -- 1024tree00
            x=2050,
            y=0,
            width=1026,
            height=1026,
	        widthFile=1026,
	        heightFile=1026,
            pivotx=0,
            pivoty=1024,
            
            trimmedName = "1024tree00"
        },
        {
            -- 128cloud00
            x=3848,
            y=0,
            width=130,
            height=130,
	        widthFile=130,
	        heightFile=130,
            pivotx=0,
            pivoty=128,
            
            trimmedName = "128cloud00"
        },
        {
            -- 2048hills00
            x=0,
            y=0,
            width=2050,
            height=1026,
	        widthFile=2050,
	        heightFile=1026,
            pivotx=0,
            pivoty=1024,
            
            trimmedName = "2048hills00"
        },
        {
            -- 2048hills01
            x=0,
            y=1026,
            width=2050,
            height=1026,
	        widthFile=2050,
	        heightFile=1026,
            pivotx=0,
            pivoty=1024,
            
            trimmedName = "2048hills01"
        },
        {
            -- 2048hills02
            x=0,
            y=2052,
            width=2050,
            height=1026,
	        widthFile=2050,
	        heightFile=1026,
            pivotx=0,
            pivoty=1024,
            
            trimmedName = "2048hills02"
        },
        {
            -- 256cloud00
            x=3590,
            y=0,
            width=258,
            height=258,
	        widthFile=258,
	        heightFile=258,
            pivotx=0,
            pivoty=256,
            
            trimmedName = "256cloud00"
        },
        {
            -- 256house00
            x=3590,
            y=258,
            width=258,
            height=258,
	        widthFile=258,
	        heightFile=258,
            pivotx=0,
            pivoty=256,
            
            trimmedName = "256house00"
        },
        {
            -- 256tree00
            x=3076,
            y=514,
            width=258,
            height=258,
	        widthFile=258,
	        heightFile=258,
            pivotx=0,
            pivoty=256,
            
            trimmedName = "256tree00"
        },
        {
            -- 512tree00
            x=3076,
            y=0,
            width=514,
            height=514,
	        widthFile=514,
	        heightFile=514,
            pivotx=0,
            pivoty=512,
            
            trimmedName = "512tree00"
        },
        {
            -- 8x8
            x=3978,
            y=0,
            width=34,
            height=34,
	        widthFile=34,
	        heightFile=34,
            pivotx=0,
            pivoty=32,
            
            trimmedName = "8x8"
        },
    },
    fileName = "images/generated_tilesheet_background_country0.png",
    sheetContentWidth = 4096,
    sheetContentHeight = 4096,
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

    ["1024tree00"] = 1,
    ["128cloud00"] = 2,
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
