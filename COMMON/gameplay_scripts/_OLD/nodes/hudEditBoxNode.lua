local drawHUD = function(self, text, x, y, w, h)
	local function drawEditBoxBase(x, y, w, h)
        -- Edit
        local bg = self.hud:boxGradient(x+1,y+1+1.5, w-2,h-2, 3,4, njli.WorldHUD.rgba(255,255,255,32), njli.WorldHUD.rgba(32,32,32,32))
        self.hud:beginPath()
        self.hud:roundedRect(x+1,y+1, w-2,h-2, 4-1)
        self.hud:fillPaint(bg)
        self.hud:fill()
        
        self.hud:beginPath()
        self.hud:roundedRect(x+0.5, y+0.5, w-1,h-1, 4-0.5)
        self.hud:strokeColor(njli.WorldHUD.rgba(0,0,0,48))
        self.hud:stroke()
    end

    drawEditBoxBase(x,y, w,h)

    self.hud:fontSize(40.0)
    self.hud:fontFace("sans")
    self.hud:fillColor(njli.WorldHUD.rgba(255,255,255,64))
    local align = bit.bor((njli.JLI_HUD_ALIGN_LEFT), (njli.JLI_HUD_ALIGN_MIDDLE))
    self.hud:textAlign(align)
    self.hud:text(x+h*0.3, y+h*0.5, text)

    return {x=x+1,y=y+1, width=w-2,height=h-2}
end

local checkTouch = function(self, pos)

    function rectangleContainsPoint(rect, point) 
        if (rect.width <= 0 or rect.height <= 0) then
            return false
        end
     
        return (point.x >= rect.x and point.x <= rect.x + rect.width and point.y >= rect.y and point.y <= rect.y + rect.height)
    end

    local point =
    {
        x = pos:x(),
        y = pos:y()
    }

    return rectangleContainsPoint(self.widget, point)
end

local renderHUD = function(self)
    self.widget = self:drawHUD(self.value, self.position:x(), self.position:y(), self.dimension:x(), self.dimension:y())
end

local actionUpdate = function(self, action, timeStep)
end

local actionComplete = function(self, action)
end

local hide = function(self, camera)
    self.node:hide(camera)
end

local enter = function(self)
end

local update = function(self, timeStep)

end

local exit = function(self)
end

local onMessage = function(self, message)
end

local collide = function(self, otherNode, collisionPoint)
end

local near = function(self, otherNode)
end

local touchDown = function(self, rayContact)
end

local touchUp = function(self, rayContact)
end

local touchMove = function(self, rayContact)
end

local touchCancelled = function(self, rayContact)
end

local delete = function(self)

    for k,v in pairs(self.nodeStates) do
        njli.World.getInstance():getWorldFactory():destroy(self.nodeStates[k])
        self.nodeStates[k] = nil
    end
    self.nodeStates = nil

    njli.World.getInstance():getWorldFactory():destroy(self.node)
    self.node = nil
end

local methods = 
{
	drawHUD = drawHUD,
    checkTouch = checkTouch,

	renderHUD = renderHUD,
    actionUpdate = actionUpdate,
    actionComplete = actionComplete,
    hide = hide,
    enter = enter,
    update = update,
    exit = exit,
    onMessage = onMessage,
    collide = collide,
    near = near,
    touchDown = touchDown,
    touchUp = touchUp,
    touchMove = touchMove,
    touchCancelled = touchCancelled,
    __gc = delete
}

local new = function(name, x, y, width, height)
    local node = njli.Node.create()
    node:setName(name)

    local names =
    {
        display = name,
    }
    local nodeStates = {}

    for k,v in pairs(names) do
        nodeStates[k] = njli.NodeState.create()
        nodeStates[k]:setName(names[k])
    end

    node:getStateMachine():pushState(nodeStates.display)

    local hud = njli.World.getInstance():getWorldHUD()

    local _x = x or 60
    local _y = y or 95

    local _width = width or 300
    local _height = height or 56

    local font = hud:createFont("sans", "fonts/Roboto-Regular.ttf")

    local properties = 
    {
        node = node,
        nodeStates = nodeStates,
        nodeStateNames = names,

        hud = hud,
        bmf = bmf,

        value = "INDESTRUCTIBLE",
        position = njli.btVector2(_x, _y),
        dimension = njli.btVector2(_width, _height),
        widget = nil,
        isTouching = false,

    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}
