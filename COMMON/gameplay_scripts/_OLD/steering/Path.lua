
local currentWaypoint = function(self)
    return self.wayPoints[self.curWayPointIndex]
end

local isFinished = function(self)
    local length = #self.wayPoints

    if self.bLooped then
        return false
    end

    return (self.curWayPointIndex >= length)
end
  
local setNextWaypoint = function(self)
    local length = #self.wayPoints

    self.curWayPointIndex = self.curWayPointIndex + 1

    if self.curWayPointIndex > length then
        if self.bLooped then
            self.curWayPointIndex = 1
        else
            self.curWayPointIndex = length
        end
    end
end

local createRandomPath = function(self, numWaypoints, minX, minY, maxX, maxY)
	assert(false, "not implemented...")
end

local loopOn = function(self)
	self.bLooped = true
end

local loopOff = function(self)
	self.bLooped = false
end

local addWayPoint = function(self, new_point)
    local length = #self.wayPoints
    self.wayPoints[length + 1] = new_point

    local currentWaypoint = self:currentWaypoint()

    if currentWaypoint == nil then
        self.currentWaypoint = self.wayPoints[length + 1]
    end
end

local setPoints = function(self, points)
    for i=1,#points do
        self:addWayPoint(points[i])
    end

    self.currentWaypoint = points[0]
end

local setPath = function(self, path)
	assert(false, "not implemented...")
end

local clear = function(self)
	self.wayPoints = {}
    self.currentWaypoint = nil
end

local getPath = function(self)
	return self.wayPoints
end


local delete = function(self)
    --TODO: clean up memory
end

local methods = 
{
    --TODO: Add functions here...

    currentWaypoint = currentWaypoint,
    isFinished = isFinished,
    setNextWaypoint = setNextWaypoint,
    createRandomPath = createRandomPath,
    loopOn = loopOn,
    loopOff = loopOff,
    addWayPoint = addWayPoint,
    setPoints = setPoints,
    setPath = setPath,
    clear = clear,
    getPath = getPath,


    __gc = delete
}

local new = function(points)
    --TODO: Implement the constructor for this object.

    local wayPoints = {}

    if points ~= nil then
        wayPoints = points
    end

    local curWayPointIndex = 1

    --flag to indicate if the path should be looped
    --(The last waypoint connected to the first)
    local bLooped = false

    local properties = 
    {
        --TODO: Add variables here...

        wayPoints = wayPoints,
        curWayPointIndex = curWayPointIndex,
        bLooped = bLooped
    }
    return setmetatable(properties, {__index = methods})
end

return {
  new = new,
}