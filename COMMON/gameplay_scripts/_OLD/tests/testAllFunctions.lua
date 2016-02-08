local ARRAY_SIZE = 2

function testActionCreateAndDeleteFunctions()
    local tempBuilder = njli.ActionBuilder.create()
    print(tempBuilder:getClassName() , ' (Builder): ', tempBuilder)

    local temp = njli.Action.create()
    print(temp:getClassName() , ' (Create): ', temp)

    local temp2 = njli.Action.clone(temp)
    print(temp2:getClassName() , ' (Clone): ', temp2)

    local temp3 = njli.Action.create(tempBuilder)
    print(temp3:getClassName() , ' (Create-builder): ', temp3)

    local temp4 = njli.Action.copy(temp)
    print(temp4:getClassName() , ' (Copy): ', temp4)

    local tempArray = njli.Action.createArray(ARRAY_SIZE)
    for i=0,(ARRAY_SIZE-1) do
        local tempArrayValue = njli.ActionArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName() , ' (CreateArray): ', tempArrayValue)
        njli.Action.destroy(tempArrayValue)
    end
    njli.Action.destroyArray(tempArray)

    print(temp4:getClassName() , ' (Destroy-4): ', temp4)
    njli.Action.destroy(temp4)

    print(temp3:getClassName() , ' (Destroy-3): ', temp3)
    njli.Action.destroy(temp3)

    print(temp2:getClassName() , ' (Destroy-2): ', temp2)
    njli.Action.destroy(temp2)

    print(temp:getClassName() , ' (Destroy): ', temp)
    njli.Action.destroy(temp)

    print(tempBuilder:getClassName() , ' (Destroy-builder): ', tempBuilder)
    njli.ActionBuilder.destroy(tempBuilder)
end

function testButtonHUDCreateAndDeleteFunctions()
    local tempBuilder = njli.ButtonHUDBuilder.create()
    print(tempBuilder:getClassName() , ' (Builder): ', tempBuilder)

    local temp = njli.ButtonHUD.create()
    print(temp:getClassName() , ' (Create): ', temp)

    local temp2 = njli.ButtonHUD.clone(temp)
    print(temp2:getClassName() , ' (Clone): ', temp2)

    local temp3 = njli.ButtonHUD.create(tempBuilder)
    print(temp3:getClassName() , ' (Create-builder): ', temp3)

    local temp4 = njli.ButtonHUD.copy(temp)
    print(temp4:getClassName() , ' (Copy): ', temp4)

    local tempArray = njli.ButtonHUD.createArray(ARRAY_SIZE)
    for i=0,(ARRAY_SIZE-1) do
        local tempArrayValue = njli.ButtonHUDArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName() , ' (CreateArray): ', tempArrayValue)
        njli.ButtonHUD.destroy(tempArrayValue)
    end
    njli.ButtonHUD.destroyArray(tempArray)

    print(temp4:getClassName() , ' (Destroy-4): ', temp4)
    njli.ButtonHUD.destroy(temp4)

    print(temp3:getClassName() , ' (Destroy-3): ', temp3)
    njli.ButtonHUD.destroy(temp3)

    print(temp2:getClassName() , ' (Destroy-2): ', temp2)
    njli.ButtonHUD.destroy(temp2)

    print(temp:getClassName() , ' (Destroy): ', temp)
    njli.ButtonHUD.destroy(temp)

    print(tempBuilder:getClassName() , ' (Destroy-builder): ', tempBuilder)
    njli.ButtonHUDBuilder.destroy(tempBuilder)
end

function testCameraCreateAndDeleteFunctions()
	local tempBuilder = njli.CameraBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.Camera.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.Camera.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.Camera.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.Camera.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.Camera.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.CameraArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.Camera.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.Camera.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.Camera.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.Camera.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.Camera.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.Camera.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.CameraBuilder.destroy(tempBuilder)
end

function testCheckboxHUDCreateAndDeleteFunctions()
    local tempBuilder = njli.CheckboxHUDBuilder.create()
    print(tempBuilder:getClassName() , ' (Builder): ', tempBuilder)

    local temp = njli.CheckboxHUD.create()
    print(temp:getClassName() , ' (Create): ', temp)

    local temp2 = njli.CheckboxHUD.clone(temp)
    print(temp2:getClassName() , ' (Clone): ', temp2)

    local temp3 = njli.CheckboxHUD.create(tempBuilder)
    print(temp3:getClassName() , ' (Create-builder): ', temp3)

    local temp4 = njli.CheckboxHUD.copy(temp)
    print(temp4:getClassName() , ' (Copy): ', temp4)

    local tempArray = njli.CheckboxHUD.createArray(ARRAY_SIZE)
    for i=0,(ARRAY_SIZE-1) do
        local tempArrayValue = njli.CheckboxHUDArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName() , ' (CreateArray): ', tempArrayValue)
        njli.CheckboxHUD.destroy(tempArrayValue)
    end
    njli.CheckboxHUD.destroyArray(tempArray)

    print(temp4:getClassName() , ' (Destroy-4): ', temp4)
    njli.CheckboxHUD.destroy(temp4)

    print(temp3:getClassName() , ' (Destroy-3): ', temp3)
    njli.CheckboxHUD.destroy(temp3)

    print(temp2:getClassName() , ' (Destroy-2): ', temp2)
    njli.CheckboxHUD.destroy(temp2)

    print(temp:getClassName() , ' (Destroy): ', temp)
    njli.CheckboxHUD.destroy(temp)

    print(tempBuilder:getClassName() , ' (Destroy-builder): ', tempBuilder)
    njli.CheckboxHUDBuilder.destroy(tempBuilder)
end

function testClockCreateAndDeleteFunctions()
	local tempBuilder = njli.ClockBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.Clock.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.Clock.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.Clock.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.Clock.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.Clock.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.ClockArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.Clock.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.Clock.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.Clock.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.Clock.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.Clock.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.Clock.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.ClockBuilder.destroy(tempBuilder)
end

function testCollisionResponseCreateAndDeleteFunctions()
	local tempBuilder = njli.CollisionResponseBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.CollisionResponse.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.CollisionResponse.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.CollisionResponse.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.CollisionResponse.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.CollisionResponse.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.CollisionResponseArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.CollisionResponse.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.CollisionResponse.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.CollisionResponse.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.CollisionResponse.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.CollisionResponse.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.CollisionResponse.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.CollisionResponseBuilder.destroy(tempBuilder)
end

function testCubeCreateAndDeleteFunctions()
	local tempBuilder = njli.CubeBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.Cube.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.Cube.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.Cube.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.Cube.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.Cube.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.CubeArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.Cube.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.Cube.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.Cube.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.Cube.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.Cube.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.Cube.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.CubeBuilder.destroy(tempBuilder)
end

function testDropdownHUDCreateAndDeleteFunctions()
    local tempBuilder = njli.DropdownHUDBuilder.create()
    print(tempBuilder:getClassName() , ' (Builder): ', tempBuilder)

    local temp = njli.DropdownHUD.create()
    print(temp:getClassName() , ' (Create): ', temp)

    local temp2 = njli.DropdownHUD.clone(temp)
    print(temp2:getClassName() , ' (Clone): ', temp2)

    local temp3 = njli.DropdownHUD.create(tempBuilder)
    print(temp3:getClassName() , ' (Create-builder): ', temp3)

    local temp4 = njli.DropdownHUD.copy(temp)
    print(temp4:getClassName() , ' (Copy): ', temp4)

    local tempArray = njli.DropdownHUD.createArray(ARRAY_SIZE)
    for i=0,(ARRAY_SIZE-1) do
        local tempArrayValue = njli.DropdownHUDArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName() , ' (CreateArray): ', tempArrayValue)
        njli.DropdownHUD.destroy(tempArrayValue)
    end
    njli.DropdownHUD.destroyArray(tempArray)

    print(temp4:getClassName() , ' (Destroy-4): ', temp4)
    njli.DropdownHUD.destroy(temp4)

    print(temp3:getClassName() , ' (Destroy-3): ', temp3)
    njli.DropdownHUD.destroy(temp3)

    print(temp2:getClassName() , ' (Destroy-2): ', temp2)
    njli.DropdownHUD.destroy(temp2)

    print(temp:getClassName() , ' (Destroy): ', temp)
    njli.DropdownHUD.destroy(temp)

    print(tempBuilder:getClassName() , ' (Destroy-builder): ', tempBuilder)
    njli.DropdownHUDBuilder.destroy(tempBuilder)
end

function testFontCreateAndDeleteFunctions()
	local tempBuilder = njli.FontBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.Font.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.Font.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.Font.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.Font.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.Font.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.FontArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.Font.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.Font.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.Font.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.Font.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.Font.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.Font.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.FontBuilder.destroy(tempBuilder)
end

function testImageCreateAndDeleteFunctions()
	local tempBuilder = njli.ImageBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.Image.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.Image.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.Image.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.Image.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.Image.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.ImageArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.Image.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.Image.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.Image.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.Image.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.Image.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.Image.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.ImageBuilder.destroy(tempBuilder)
end

function testJsonCreateAndDeleteFunctions()
	local tempBuilder = njli.JsonBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.Json.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.Json.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.Json.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.Json.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.Json.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.JsonArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.Json.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.Json.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.Json.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.Json.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.Json.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.Json.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.JsonBuilder.destroy(tempBuilder)
end

function testLabelHUDCreateAndDeleteFunctions()
    local tempBuilder = njli.LabelHUDBuilder.create()
    print(tempBuilder:getClassName() , ' (Builder): ', tempBuilder)

    local temp = njli.LabelHUD.create()
    print(temp:getClassName() , ' (Create): ', temp)

    local temp2 = njli.LabelHUD.clone(temp)
    print(temp2:getClassName() , ' (Clone): ', temp2)

    local temp3 = njli.LabelHUD.create(tempBuilder)
    print(temp3:getClassName() , ' (Create-builder): ', temp3)

    local temp4 = njli.LabelHUD.copy(temp)
    print(temp4:getClassName() , ' (Copy): ', temp4)

    local tempArray = njli.LabelHUD.createArray(ARRAY_SIZE)
    for i=0,(ARRAY_SIZE-1) do
        local tempArrayValue = njli.LabelHUDArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName() , ' (CreateArray): ', tempArrayValue)
        njli.LabelHUD.destroy(tempArrayValue)
    end
    njli.LabelHUD.destroyArray(tempArray)

    print(temp4:getClassName() , ' (Destroy-4): ', temp4)
    njli.LabelHUD.destroy(temp4)

    print(temp3:getClassName() , ' (Destroy-3): ', temp3)
    njli.LabelHUD.destroy(temp3)

    print(temp2:getClassName() , ' (Destroy-2): ', temp2)
    njli.LabelHUD.destroy(temp2)

    print(temp:getClassName() , ' (Destroy): ', temp)
    njli.LabelHUD.destroy(temp)

    print(tempBuilder:getClassName() , ' (Destroy-builder): ', tempBuilder)
    njli.LabelHUDBuilder.destroy(tempBuilder)
end

function testLightCreateAndDeleteFunctions()
	local tempBuilder = njli.LightBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.Light.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.Light.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.Light.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.Light.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.Light.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.LightArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.Light.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.Light.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.Light.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.Light.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.Light.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.Light.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.LightBuilder.destroy(tempBuilder)
end

function testLevelOfDetailCreateAndDeleteFunctions()
	local tempBuilder = njli.LevelOfDetailBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.LevelOfDetail.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.LevelOfDetail.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.LevelOfDetail.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.LevelOfDetail.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.LevelOfDetail.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.LevelOfDetailArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.LevelOfDetail.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.LevelOfDetail.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.LevelOfDetail.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.LevelOfDetail.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.LevelOfDetail.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.LevelOfDetail.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.LevelOfDetailBuilder.destroy(tempBuilder)
end

function testLuaCreateAndDeleteFunctions()
	local tempBuilder = njli.LuaBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.Lua.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.Lua.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.Lua.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.Lua.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.Lua.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.LuaArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.Lua.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.Lua.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.Lua.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.Lua.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.Lua.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.Lua.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.LuaBuilder.destroy(tempBuilder)
end

function testMaterialCreateAndDeleteFunctions()
	local tempBuilder = njli.MaterialBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.Material.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.Material.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.Material.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.Material.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.Material.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.MaterialArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.Material.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.Material.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.Material.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.Material.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.Material.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.Material.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.MaterialBuilder.destroy(tempBuilder)
end

function testMaterialPropertyCreateAndDeleteFunctions()
	local tempBuilder = njli.MaterialPropertyBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.MaterialProperty.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.MaterialProperty.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.MaterialProperty.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.MaterialProperty.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.MaterialProperty.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.MaterialPropertyArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.MaterialProperty.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.MaterialProperty.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.MaterialProperty.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.MaterialProperty.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.MaterialProperty.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.MaterialProperty.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.MaterialPropertyBuilder.destroy(tempBuilder)
end

function testNodeCreateAndDeleteFunctions()
	local tempBuilder = njli.NodeBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.Node.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.Node.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.Node.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.Node.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.Node.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.NodeArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.Node.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.Node.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.Node.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.Node.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.Node.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.Node.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.NodeBuilder.destroy(tempBuilder)
end

function testNodeStateCreateAndDeleteFunctions()
	local tempBuilder = njli.NodeStateBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.NodeState.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.NodeState.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.NodeState.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.NodeState.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.NodeState.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.NodeStateArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.NodeState.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.NodeState.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.NodeState.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.NodeState.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.NodeState.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.NodeState.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.NodeStateBuilder.destroy(tempBuilder)
end

function testNodeStateMachineCreateAndDeleteFunctions()
	local tempBuilder = njli.NodeStateMachineBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.NodeStateMachine.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.NodeStateMachine.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.NodeStateMachine.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.NodeStateMachine.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.NodeStateMachine.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.NodeStateMachineArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.NodeStateMachine.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.NodeStateMachine.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.NodeStateMachine.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.NodeStateMachine.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.NodeStateMachine.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.NodeStateMachine.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.NodeStateMachineBuilder.destroy(tempBuilder)
end

function testParticleEmitterCreateAndDeleteFunctions()
	local tempBuilder = njli.ParticleEmitterBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.ParticleEmitter.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.ParticleEmitter.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.ParticleEmitter.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.ParticleEmitter.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.ParticleEmitter.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.ParticleEmitterArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.ParticleEmitter.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.ParticleEmitter.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.ParticleEmitter.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.ParticleEmitter.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.ParticleEmitter.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.ParticleEmitter.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.ParticleEmitterBuilder.destroy(tempBuilder)
end

function testPhysicsBodyGhostCreateAndDeleteFunctions()
	local tempBuilder = njli.PhysicsBodyGhostBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.PhysicsBodyGhost.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.PhysicsBodyGhost.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.PhysicsBodyGhost.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.PhysicsBodyGhost.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.PhysicsBodyGhost.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.PhysicsBodyGhostArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.PhysicsBodyGhost.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.PhysicsBodyGhost.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.PhysicsBodyGhost.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.PhysicsBodyGhost.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.PhysicsBodyGhost.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.PhysicsBodyGhost.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.PhysicsBodyGhostBuilder.destroy(tempBuilder)
end

function testPhysicsBodyRigidCreateAndDeleteFunctions()
	local tempBuilder = njli.PhysicsBodyRigidBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.PhysicsBodyRigid.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.PhysicsBodyRigid.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.PhysicsBodyRigid.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.PhysicsBodyRigid.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.PhysicsBodyRigid.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.PhysicsBodyRigidArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.PhysicsBodyRigid.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.PhysicsBodyRigid.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.PhysicsBodyRigid.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.PhysicsBodyRigid.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.PhysicsBodyRigid.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.PhysicsBodyRigid.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.PhysicsBodyRigidBuilder.destroy(tempBuilder)
end

function testPhysicsBodySoftCreateAndDeleteFunctions()
	local tempBuilder = njli.PhysicsBodySoftBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.PhysicsBodySoft.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.PhysicsBodySoft.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.PhysicsBodySoft.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.PhysicsBodySoft.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.PhysicsBodySoft.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.PhysicsBodySoftArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.PhysicsBodySoft.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.PhysicsBodySoft.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.PhysicsBodySoft.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.PhysicsBodySoft.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.PhysicsBodySoft.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.PhysicsBodySoft.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.PhysicsBodySoftBuilder.destroy(tempBuilder)
end

function testPhysicsContactCreateAndDeleteFunctions()
	local tempBuilder = njli.PhysicsContactBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.PhysicsContact.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.PhysicsContact.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.PhysicsContact.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.PhysicsContact.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.PhysicsContact.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.PhysicsContactArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.PhysicsContact.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.PhysicsContact.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.PhysicsContact.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.PhysicsContact.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.PhysicsContact.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.PhysicsContact.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.PhysicsContactBuilder.destroy(tempBuilder)
end

function testPhysicsCloseContactCreateAndDeleteFunctions()
	local tempBuilder = njli.PhysicsCloseContactBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.PhysicsCloseContact.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.PhysicsCloseContact.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.PhysicsCloseContact.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.PhysicsCloseContact.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.PhysicsCloseContact.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.PhysicsCloseContactArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.PhysicsCloseContact.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.PhysicsCloseContact.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.PhysicsCloseContact.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.PhysicsCloseContact.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.PhysicsCloseContact.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.PhysicsCloseContact.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.PhysicsCloseContactBuilder.destroy(tempBuilder)
end

function testPhysicsFieldCreateAndDeleteFunctions()
	local tempBuilder = njli.PhysicsFieldBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.PhysicsField.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.PhysicsField.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.PhysicsField.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.PhysicsField.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.PhysicsField.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.PhysicsFieldArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.PhysicsField.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.PhysicsField.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.PhysicsField.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.PhysicsField.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.PhysicsField.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.PhysicsField.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.PhysicsFieldBuilder.destroy(tempBuilder)
end

function testPhysicsRayContactCreateAndDeleteFunctions()
	local tempBuilder = njli.PhysicsRayContactBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.PhysicsRayContact.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.PhysicsRayContact.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.PhysicsRayContact.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.PhysicsRayContact.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.PhysicsRayContact.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.PhysicsRayContactArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.PhysicsRayContact.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.PhysicsRayContact.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.PhysicsRayContact.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.PhysicsRayContact.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.PhysicsRayContact.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.PhysicsRayContact.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.PhysicsRayContactBuilder.destroy(tempBuilder)
end

function testPhysicsShapeBoxCreateAndDeleteFunctions()
	local tempBuilder = njli.PhysicsShapeBoxBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.PhysicsShapeBox.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.PhysicsShapeBox.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.PhysicsShapeBox.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.PhysicsShapeBox.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.PhysicsShapeBox.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.PhysicsShapeBoxArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.PhysicsShapeBox.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.PhysicsShapeBox.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.PhysicsShapeBox.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.PhysicsShapeBox.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.PhysicsShapeBox.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.PhysicsShapeBox.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.PhysicsShapeBoxBuilder.destroy(tempBuilder)
end

function testPhysicsWorldCreateAndDeleteFunctions()
	local tempBuilder = njli.PhysicsWorldBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.PhysicsWorld.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.PhysicsWorld.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.PhysicsWorld.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.PhysicsWorld.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.PhysicsWorld.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.PhysicsWorldArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.PhysicsWorld.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.PhysicsWorld.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.PhysicsWorld.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.PhysicsWorld.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.PhysicsWorld.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.PhysicsWorld.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.PhysicsWorldBuilder.destroy(tempBuilder)
end

function testPlaneCreateAndDeleteFunctions()
	local tempBuilder = njli.PlaneBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.Plane.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.Plane.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.Plane.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.Plane.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.Plane.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.PlaneArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.Plane.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.Plane.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.Plane.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.Plane.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.Plane.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.Plane.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.PlaneBuilder.destroy(tempBuilder)
end

function testSceneCreateAndDeleteFunctions()
	local tempBuilder = njli.SceneBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.Scene.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.Scene.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.Scene.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.Scene.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.Scene.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.SceneArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.Scene.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.Scene.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.Scene.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.Scene.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.Scene.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.Scene.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.SceneBuilder.destroy(tempBuilder)
end

function testSceneStateCreateAndDeleteFunctions()
	local tempBuilder = njli.SceneStateBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.SceneState.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.SceneState.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.SceneState.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.SceneState.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.SceneState.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.SceneStateArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.SceneState.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.SceneState.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.SceneState.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.SceneState.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.SceneState.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.SceneState.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.SceneStateBuilder.destroy(tempBuilder)
end

function testSceneStateMachineCreateAndDeleteFunctions()
	local tempBuilder = njli.SceneStateMachineBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.SceneStateMachine.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.SceneStateMachine.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.SceneStateMachine.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.SceneStateMachine.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.SceneStateMachine.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.SceneStateMachineArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.SceneStateMachine.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.SceneStateMachine.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.SceneStateMachine.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.SceneStateMachine.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.SceneStateMachine.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.SceneStateMachine.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.SceneStateMachineBuilder.destroy(tempBuilder)
end

function testShaderProgramCreateAndDeleteFunctions()
	local tempBuilder = njli.ShaderProgramBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.ShaderProgram.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.ShaderProgram.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.ShaderProgram.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.ShaderProgram.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.ShaderProgram.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.ShaderProgramArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.ShaderProgram.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.ShaderProgram.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.ShaderProgram.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.ShaderProgram.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.ShaderProgram.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.ShaderProgram.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.ShaderProgramBuilder.destroy(tempBuilder)
end

function testSkinnerCreateAndDeleteFunctions()
	local tempBuilder = njli.SkinnerBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.Skinner.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.Skinner.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.Skinner.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.Skinner.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.Skinner.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.SkinnerArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.Skinner.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.Skinner.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.Skinner.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.Skinner.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.Skinner.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.Skinner.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.SkinnerBuilder.destroy(tempBuilder)
end

function testSliderHUDCreateAndDeleteFunctions()
    local tempBuilder = njli.SliderHUDBuilder.create()
    print(tempBuilder:getClassName() , ' (Builder): ', tempBuilder)

    local temp = njli.SliderHUD.create()
    print(temp:getClassName() , ' (Create): ', temp)

    local temp2 = njli.SliderHUD.clone(temp)
    print(temp2:getClassName() , ' (Clone): ', temp2)

    local temp3 = njli.SliderHUD.create(tempBuilder)
    print(temp3:getClassName() , ' (Create-builder): ', temp3)

    local temp4 = njli.SliderHUD.copy(temp)
    print(temp4:getClassName() , ' (Copy): ', temp4)

    local tempArray = njli.SliderHUD.createArray(ARRAY_SIZE)
    for i=0,(ARRAY_SIZE-1) do
        local tempArrayValue = njli.SliderHUDArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName() , ' (CreateArray): ', tempArrayValue)
        njli.SliderHUD.destroy(tempArrayValue)
    end
    njli.SliderHUD.destroyArray(tempArray)

    print(temp4:getClassName() , ' (Destroy-4): ', temp4)
    njli.SliderHUD.destroy(temp4)

    print(temp3:getClassName() , ' (Destroy-3): ', temp3)
    njli.SliderHUD.destroy(temp3)

    print(temp2:getClassName() , ' (Destroy-2): ', temp2)
    njli.SliderHUD.destroy(temp2)

    print(temp:getClassName() , ' (Destroy): ', temp)
    njli.SliderHUD.destroy(temp)

    print(tempBuilder:getClassName() , ' (Destroy-builder): ', tempBuilder)
    njli.SliderHUDBuilder.destroy(tempBuilder)
end

function testSoundCreateAndDeleteFunctions()
	local tempBuilder = njli.SoundBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.Sound.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.Sound.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.Sound.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.Sound.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.Sound.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.SoundArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.Sound.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.Sound.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.Sound.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.Sound.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.Sound.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.Sound.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.SoundBuilder.destroy(tempBuilder)
end

function testSprite2DCreateAndDeleteFunctions()
	local tempBuilder = njli.Sprite2DBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.Sprite2D.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.Sprite2D.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.Sprite2D.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.Sprite2D.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.Sprite2D.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.Sprite2DArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.Sprite2D.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.Sprite2D.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.Sprite2D.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.Sprite2D.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.Sprite2D.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.Sprite2D.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.Sprite2DBuilder.destroy(tempBuilder)
end

function testSpriteFrameAtlasCreateAndDeleteFunctions()
	local tempBuilder = njli.SpriteFrameAtlasBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.SpriteFrameAtlas.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.SpriteFrameAtlas.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.SpriteFrameAtlas.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.SpriteFrameAtlas.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.SpriteFrameAtlas.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.SpriteFrameAtlasArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.SpriteFrameAtlas.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.SpriteFrameAtlas.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.SpriteFrameAtlas.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.SpriteFrameAtlas.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.SpriteFrameAtlas.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.SpriteFrameAtlas.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.SpriteFrameAtlasBuilder.destroy(tempBuilder)
end

function testStopWatchCreateAndDeleteFunctions()
	local tempBuilder = njli.StopWatchBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.StopWatch.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.StopWatch.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.StopWatch.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.StopWatch.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.StopWatch.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.StopWatchArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.StopWatch.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.StopWatch.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.StopWatch.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.StopWatch.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.StopWatch.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.StopWatch.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.StopWatchBuilder.destroy(tempBuilder)
end

function testTextboxHUDCreateAndDeleteFunctions()
    local tempBuilder = njli.TextboxHUDBuilder.create()
    print(tempBuilder:getClassName() , ' (Builder): ', tempBuilder)

    local temp = njli.TextboxHUD.create()
    print(temp:getClassName() , ' (Create): ', temp)

    local temp2 = njli.TextboxHUD.clone(temp)
    print(temp2:getClassName() , ' (Clone): ', temp2)

    local temp3 = njli.TextboxHUD.create(tempBuilder)
    print(temp3:getClassName() , ' (Create-builder): ', temp3)

    local temp4 = njli.TextboxHUD.copy(temp)
    print(temp4:getClassName() , ' (Copy): ', temp4)

    local tempArray = njli.TextboxHUD.createArray(ARRAY_SIZE)
    for i=0,(ARRAY_SIZE-1) do
        local tempArrayValue = njli.TextboxHUDArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName() , ' (CreateArray): ', tempArrayValue)
        njli.TextboxHUD.destroy(tempArrayValue)
    end
    njli.TextboxHUD.destroyArray(tempArray)

    print(temp4:getClassName() , ' (Destroy-4): ', temp4)
    njli.TextboxHUD.destroy(temp4)

    print(temp3:getClassName() , ' (Destroy-3): ', temp3)
    njli.TextboxHUD.destroy(temp3)

    print(temp2:getClassName() , ' (Destroy-2): ', temp2)
    njli.TextboxHUD.destroy(temp2)

    print(temp:getClassName() , ' (Destroy): ', temp)
    njli.TextboxHUD.destroy(temp)

    print(tempBuilder:getClassName() , ' (Destroy-builder): ', tempBuilder)
    njli.TextboxHUDBuilder.destroy(tempBuilder)
end

function testTimerCreateAndDeleteFunctions()
	local tempBuilder = njli.TimerBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.Timer.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.Timer.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.Timer.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.Timer.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.Timer.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.TimerArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.Timer.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.Timer.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.Timer.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.Timer.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.Timer.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.Timer.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.TimerBuilder.destroy(tempBuilder)
end

function testWorldStateCreateAndDeleteFunctions()
	local tempBuilder = njli.WorldStateBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.WorldState.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.WorldState.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.WorldState.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.WorldState.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.WorldState.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.WorldStateArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.WorldState.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.WorldState.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.WorldState.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.WorldState.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.WorldState.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.WorldState.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.WorldStateBuilder.destroy(tempBuilder)
end

function testWorldStateMachineCreateAndDeleteFunctions()
	local tempBuilder = njli.WorldStateMachineBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.WorldStateMachine.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.WorldStateMachine.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.WorldStateMachine.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.WorldStateMachine.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.WorldStateMachine.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.WorldStateMachineArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.WorldStateMachine.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.WorldStateMachine.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.WorldStateMachine.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.WorldStateMachine.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.WorldStateMachine.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.WorldStateMachine.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.WorldStateMachineBuilder.destroy(tempBuilder)
end

function testXmlCreateAndDeleteFunctions()
	local tempBuilder = njli.XmlBuilder.create()
	print(tempBuilder:getClassName(), ' (Builder): ', tempBuilder)

	local temp = njli.Xml.create()
	print(temp:getClassName(), ' (Create): ', temp)

	local temp2 = njli.Xml.clone(temp)
	print(temp2:getClassName(), ' (Clone): ', temp2)

	local temp3 = njli.Xml.create(tempBuilder)
	print(temp3:getClassName(), ' (Create-builder): ', temp3)

	local temp4 = njli.Xml.copy(temp)
	print(temp4:getClassName(), ' (Copy): ', temp4)

	local tempArray = njli.Xml.createArray(ARRAY_SIZE)
	for i = 0, (ARRAY_SIZE-1) do
		local tempArrayValue = njli.XmlArray_getitem(tempArray, i)
        print(tempArrayValue:getClassName(), ' (CreateArray): ', tempArrayValue)
        njli.Xml.destroy(tempArrayValue)
	end
	print(' (Destroy-Array) ')
	njli.Xml.destroyArray(tempArray)

	print(temp4:getClassName(), ' (Destroy-4): ', temp4)
	njli.Xml.destroy(temp4)

	print(temp3:getClassName(), ' (Destroy-3): ', temp3)
	njli.Xml.destroy(temp3)

	print(temp2:getClassName(), ' (Destroy-2): ', temp2)
	njli.Xml.destroy(temp2)

	print(temp:getClassName(), ' (Destroy-): ', temp)
	njli.Xml.destroy(temp)

	print(tempBuilder:getClassName(), ' (Destroy-builder): ', tempBuilder)
	njli.XmlBuilder.destroy(tempBuilder)
end




























































function testWorldFunctions()
end

function testWorldFactoryFunctions()
end

function testWorldLuaVirtualMachineFunctions()
end

function testWorldResourceLoaderFunctions()
end

function testWorldSocketFunctions()
end

function testWorldHUDFunctions()
end

function testWorldInputFunctions()
end

function testWorldClockFunctions()
end

function testDeviceTouchFunctions()
end

function testActionFunctions()
end

function testActionBuilderFunctions()
end

function testButtonHUDFunctions()
    print('Testing functions for the ButtonHUD class')
end

function testButtonHUDBuilderFunctions()
    print('Testing functions for the ButtonHUDBuilder class')
end

function testCameraFunctions()
end

function testCameraBuilderFunctions()
end

function testCheckboxHUDFunctions()
    print('Testing functions for the CheckboxHUD class')
end

function testCheckboxHUDBuilderFunctions()
    print('Testing functions for the CheckboxHUDBuilder class')
end

function testClockFunctions()
end

function testClockBuilderFunctions()
end

function testCollisionResponseFunctions()
end

function testCollisionResponseBuilderFunctions()
end

function testCubeFunctions()
end

function testCubeBuilderFunctions()
end

function testDropdownHUDFunctions()
    print('Testing functions for the DropdownHUD class')
end

function testDropdownHUDBuilderFunctions()
    print('Testing functions for the DropdownHUDBuilder class')
end

function testFontFunctions()
end

function testFontBuilderFunctions()
end

function testImageFunctions()
end

function testImageBuilderFunctions()
end

function testJsonFunctions()
end

function testJsonBuilderFunctions()
end

function testLabelHUDFunctions()
    print('Testing functions for the LabelHUD class')
end

function testLabelHUDBuilderFunctions()
    print('Testing functions for the LabelHUDBuilder class')
end

function testLightFunctions()
end

function testLightBuilderFunctions()
end

function testLevelOfDetailFunctions()
end

function testLevelOfDetailBuilderFunctions()
end

function testLuaFunctions()
end

function testLuaBuilderFunctions()
end

function testMaterialFunctions()
end

function testMaterialBuilderFunctions()
end

function testMaterialPropertyFunctions()
end

function testMaterialPropertyBuilderFunctions()
end

function testNodeFunctions()
end

function testNodeBuilderFunctions()
end

function testNodeStateFunctions()
end

function testNodeStateBuilderFunctions()
end

function testNodeStateMachineFunctions()
end

function testNodeStateMachineBuilderFunctions()
end

function testParticleEmitterFunctions()
end

function testParticleEmitterBuilderFunctions()
end

function testPhysicsBodyFunctions()
end

function testPhysicsBodyGhostFunctions()
end

function testPhysicsBodyGhostBuilderFunctions()
end

function testPhysicsBodyRigidFunctions()
end

function testPhysicsBodyRigidBuilderFunctions()
end

function testPhysicsBodySoftFunctions()
end

function testPhysicsBodySoftBuilderFunctions()
end

function testPhysicsContactFunctions()
end

function testPhysicsContactBuilderFunctions()
end

function testPhysicsCloseContactFunctions()
end

function testPhysicsCloseContactBuilderFunctions()
end

function testPhysicsFieldFunctions()
end

function testPhysicsFieldBuilderFunctions()
end

function testPhysicsRayContactFunctions()
end

function testPhysicsRayContactBuilderFunctions()
end

function testPhysicsShapeBoxFunctions()
    local tempBuilder = njli.PhysicsShapeBoxBuilder.create()
    print(tempBuilder:getClassName() , ' (Builder): ', tempBuilder)

    local temp = njli.PhysicsShapeBox.create()
    print(temp:getClassName() , ' (Create): ', temp)

    local temp2 = njli.PhysicsShapeBox.clone(temp)
    print(temp2:getClassName() , ' (Clone): ', temp2)

    local temp3 = njli.PhysicsShapeBox.create(tempBuilder)
    print(temp3:getClassName() , ' (Create-builder): ' , temp3)

    local temp4 = njli.PhysicsShapeBox.copy(temp)
    print(temp4:getClassName() , ' (Copy): ', temp4)


    temp:setHalfExtends(njli.btVector3(11,122,133))
    print('getHalfExtentsWithMargin ' , temp:getHalfExtentsWithMargin())
    print('getHalfExtentsWithoutMargin ' , temp:getHalfExtentsWithoutMargin())

    temp:setHalfExtends(njli.btVector3(9999,9999,9999))
    print('getHalfExtentsWithMargin ' , temp:getHalfExtentsWithMargin())
    print('getHalfExtentsWithoutMargin ' , temp:getHalfExtentsWithoutMargin())

    local identity = njli.btTransform(njli.btTransform.getIdentity())
    aabMin, aabMax = temp:getAabb(identity)
    print(aabMin , ' - ' , aabMax)

    print('getNumPlanes ' , temp:getNumPlanes())
    print('getNumVertices ' , temp:getNumVertices())
    print('getNumEdges ' , temp:getNumEdges())


    for i=0, temp:getNumEdges() - 1 do
    print('Edge (' , i , ') ' , temp:getEdge(i))
    end

    for i=0, temp:getNumVertices()- 1 do
    print('Vertex (' , i , ') ' , temp:getVertex(i))
    end

    for i=0, temp:getNumPlanes() - 1 do
    print('Plane (' , i , ') ' , temp:getPlane(i))
    end

    for i=0, temp:getNumPlanes() - 1 do
    print('PlaneEquation (' , i , ') ' , temp:getPlaneEquation(i))
    end

    --localGetSupportingVertex()
    --localGetSupportingVertexWithoutMargin()
    --batchedUnitVectorGetSupportingVertexWithoutMargin()
    --setMargin()
    --setLocalScaling()
    --calculateLocalInertia()

    njli.PhysicsShapeBox.destroy(temp)
    njli.PhysicsShapeBox.destroy(temp2)
    njli.PhysicsShapeBox.destroy(temp3)
    njli.PhysicsShapeBox.destroy(temp4)
    njli.PhysicsShapeBoxBuilder.destroy(tempBuilder)
end

function testPhysicsShapeBoxBuilderFunctions()
end

function testPhysicsWorldFunctions()
end

function testPhysicsWorldBuilderFunctions()
end

function testPlaneFunctions()
end

function testPlaneBuilderFunctions()
end

function testSceneFunctions()
end

function testSceneBuilderFunctions()
end

function testSceneStateFunctions()
end

function testSceneStateBuilderFunctions()
end

function testSceneStateMachineFunctions()
end

function testSceneStateMachineBuilderFunctions()
end

function testShaderProgramFunctions()
end

function testShaderProgramBuilderFunctions()
end

function testSkinnerFunctions()
end

function testSkinnerBuilderFunctions()
end

function testSliderHUDFunctions()
    print('Testing functions for the SliderHUD class')
end

function testSliderHUDBuilderFunctions()
    print('Testing functions for the SliderHUDBuilder class')
end

function testSoundFunctions()
end

function testSoundBuilderFunctions()
end

function testSprite2DFunctions()
end

function testSprite2DBuilderFunctions()
end

function testSpriteFrameAtlasFunctions()
end

function testSpriteFrameAtlasBuilderFunctions()
end

function testStopWatchFunctions()
end

function testStopWatchBuilderFunctions()
end

function testTextboxHUDFunctions()
    print('Testing functions for the TextboxHUD class')
end

function testTextboxHUDBuilderFunctions()
    print('Testing functions for the TextboxHUDBuilder class')
end

function testTimerFunctions()
end

function testTimerBuilderFunctions()
end

function testWorldStateFunctions()
end

function testWorldStateBuilderFunctions()
end

function testWorldStateMachineFunctions()
end

function testWorldStateMachineBuilderFunctions()
end

function testXmlFunctions()
end

function testXmlBuilderFunctions()
end





































function testPhysicsShapeBoxFunctions()

end


















function testRenderCategories()
    print('none ' , njli.JLI_BIT_CATEGORY_NONE)
    print('1 ' , njli.JLI_BIT_CATEGORY_1)
    print('2 ' , njli.JLI_BIT_CATEGORY_2)
    print('3 ' , njli.JLI_BIT_CATEGORY_3)
    print('4 ' , njli.JLI_BIT_CATEGORY_4)
    print('5 ' , njli.JLI_BIT_CATEGORY_5)
    print('6 ' , njli.JLI_BIT_CATEGORY_6)
    print('7 ' , njli.JLI_BIT_CATEGORY_7)
    print('8 ' , njli.JLI_BIT_CATEGORY_8)
    print('9 ' , njli.JLI_BIT_CATEGORY_9)
    print('10 ' , njli.JLI_BIT_CATEGORY_10)
    print('11 ' , njli.JLI_BIT_CATEGORY_11)
    print('12 ' , njli.JLI_BIT_CATEGORY_12)
    print('13 ' , njli.JLI_BIT_CATEGORY_13)
    print('14 ' , njli.JLI_BIT_CATEGORY_14)
    print('15 ' , njli.JLI_BIT_CATEGORY_15)
    print('16 ' , njli.JLI_BIT_CATEGORY_16)
    print('17 ' , njli.JLI_BIT_CATEGORY_17)
    print('18 ' , njli.JLI_BIT_CATEGORY_18)
    print('19 ' , njli.JLI_BIT_CATEGORY_19)
    print('20 ' , njli.JLI_BIT_CATEGORY_20)
    print('21 ' , njli.JLI_BIT_CATEGORY_21)
    print('22 ' , njli.JLI_BIT_CATEGORY_22)
    print('23 ' , njli.JLI_BIT_CATEGORY_23)
    print('24 ' , njli.JLI_BIT_CATEGORY_24)
    print('25 ' , njli.JLI_BIT_CATEGORY_25)
    print('26 ' , njli.JLI_BIT_CATEGORY_26)
    print('27 ' , njli.JLI_BIT_CATEGORY_27)
    print('28 ' , njli.JLI_BIT_CATEGORY_28)
    print('29 ' , njli.JLI_BIT_CATEGORY_29)
    print('30 ' , njli.JLI_BIT_CATEGORY_30)
    print('31 ' , njli.JLI_BIT_CATEGORY_31)
    print('ALL ' , njli.JLI_BIT_CATEGORY_ALL)
end

function callTestFunctions()
    testActionCreateAndDeleteFunctions()
    testButtonHUDCreateAndDeleteFunctions()
    testCameraCreateAndDeleteFunctions()
    testCheckboxHUDCreateAndDeleteFunctions()
    testClockCreateAndDeleteFunctions()
    testCollisionResponseCreateAndDeleteFunctions()
    testCubeCreateAndDeleteFunctions()
    testDropdownHUDCreateAndDeleteFunctions()
    testFontCreateAndDeleteFunctions()
    testImageCreateAndDeleteFunctions()
    testJsonCreateAndDeleteFunctions()
    testLabelHUDCreateAndDeleteFunctions()
    testLightCreateAndDeleteFunctions()
    testLevelOfDetailCreateAndDeleteFunctions()
    testLuaCreateAndDeleteFunctions()
    testMaterialCreateAndDeleteFunctions()
    testMaterialPropertyCreateAndDeleteFunctions()
    testNodeCreateAndDeleteFunctions()
    testNodeStateCreateAndDeleteFunctions()
    testNodeStateMachineCreateAndDeleteFunctions()
    testParticleEmitterCreateAndDeleteFunctions()
    testPhysicsBodyGhostCreateAndDeleteFunctions()
    testPhysicsBodyRigidCreateAndDeleteFunctions()
    testPhysicsBodySoftCreateAndDeleteFunctions()
    testPhysicsContactCreateAndDeleteFunctions()
    testPhysicsCloseContactCreateAndDeleteFunctions()
    testPhysicsFieldCreateAndDeleteFunctions()
    testPhysicsRayContactCreateAndDeleteFunctions()
    testPhysicsShapeBoxCreateAndDeleteFunctions()
    testPhysicsWorldCreateAndDeleteFunctions()
    testPlaneCreateAndDeleteFunctions()
    testSceneCreateAndDeleteFunctions()
    testSceneStateCreateAndDeleteFunctions()
    testSceneStateMachineCreateAndDeleteFunctions()
    testShaderProgramCreateAndDeleteFunctions()
    testSkinnerCreateAndDeleteFunctions()
    testSliderHUDCreateAndDeleteFunctions()
    testSoundCreateAndDeleteFunctions()
    testSprite2DCreateAndDeleteFunctions()
    testSpriteFrameAtlasCreateAndDeleteFunctions()
    testStopWatchCreateAndDeleteFunctions()
    testTextboxHUDCreateAndDeleteFunctions()
    testTimerCreateAndDeleteFunctions()
    testWorldStateCreateAndDeleteFunctions()
    testWorldStateMachineCreateAndDeleteFunctions()
    testXmlCreateAndDeleteFunctions()




	
	
	
	
	
	






















    testWorldFunctions()
    testWorldFactoryFunctions()
    testWorldLuaVirtualMachineFunctions()
    testWorldResourceLoaderFunctions()
    testWorldSocketFunctions()
    testWorldHUDFunctions()
    testWorldInputFunctions()
    testWorldClockFunctions()
    testDeviceTouchFunctions()
    testActionFunctions()
    testActionBuilderFunctions()
    testButtonHUDFunctions()
    testButtonHUDBuilderFunctions()
    testCameraFunctions()
    testCameraBuilderFunctions()
    testCheckboxHUDFunctions()
    testCheckboxHUDBuilderFunctions()
    testClockFunctions()
    testClockBuilderFunctions()
    testCollisionResponseFunctions()
    testCollisionResponseBuilderFunctions()
    testCubeFunctions()
    testCubeBuilderFunctions()
    testDropdownHUDFunctions()
    testDropdownHUDBuilderFunctions()
    testFontFunctions()
    testFontBuilderFunctions()
    testImageFunctions()
    testImageBuilderFunctions()
    testJsonFunctions()
    testJsonBuilderFunctions()
    testLabelHUDFunctions()
    testLabelHUDBuilderFunctions()
    testLightFunctions()
    testLightBuilderFunctions()
    testLevelOfDetailFunctions()
    testLevelOfDetailBuilderFunctions()
    testLuaFunctions()
    testLuaBuilderFunctions()
    testMaterialFunctions()
    testMaterialBuilderFunctions()
    testMaterialPropertyFunctions()
    testMaterialPropertyBuilderFunctions()
    testNodeFunctions()
    testNodeBuilderFunctions()
    testNodeStateFunctions()
    testNodeStateBuilderFunctions()
    testNodeStateMachineFunctions()
    testNodeStateMachineBuilderFunctions()
    testParticleEmitterFunctions()
    testParticleEmitterBuilderFunctions()
    testPhysicsBodyFunctions()
    testPhysicsBodyGhostFunctions()
    testPhysicsBodyGhostBuilderFunctions()
    testPhysicsBodyRigidFunctions()
    testPhysicsBodyRigidBuilderFunctions()
    testPhysicsBodySoftFunctions()
    testPhysicsBodySoftBuilderFunctions()
    testPhysicsContactFunctions()
    testPhysicsContactBuilderFunctions()
    testPhysicsCloseContactFunctions()
    testPhysicsCloseContactBuilderFunctions()
    testPhysicsFieldFunctions()
    testPhysicsFieldBuilderFunctions()
    testPhysicsRayContactFunctions()
    testPhysicsRayContactBuilderFunctions()
    testPhysicsShapeBoxFunctions()
    testPhysicsShapeBoxBuilderFunctions()
    testPhysicsWorldFunctions()
    testPhysicsWorldBuilderFunctions()
    testPlaneFunctions()
    testPlaneBuilderFunctions()
    testSceneFunctions()
    testSceneBuilderFunctions()
    testSceneStateFunctions()
    testSceneStateBuilderFunctions()
    testSceneStateMachineFunctions()
    testSceneStateMachineBuilderFunctions()
    testShaderProgramFunctions()
    testShaderProgramBuilderFunctions()
    testSkinnerFunctions()
    testSkinnerBuilderFunctions()
    testSliderHUDFunctions()
    testSliderHUDBuilderFunctions()
    testSoundFunctions()
    testSoundBuilderFunctions()
    testSprite2DFunctions()
    testSprite2DBuilderFunctions()
    testSpriteFrameAtlasFunctions()
    testSpriteFrameAtlasBuilderFunctions()
    testStopWatchFunctions()
    testStopWatchBuilderFunctions()
    testTextboxHUDFunctions()
    testTextboxHUDBuilderFunctions()
    testTimerFunctions()
    testTimerBuilderFunctions()
    testWorldStateFunctions()
    testWorldStateBuilderFunctions()
    testWorldStateMachineFunctions()
    testWorldStateMachineBuilderFunctions()
    testXmlFunctions()
    testXmlBuilderFunctions()
    
end


callTestFunctions()








