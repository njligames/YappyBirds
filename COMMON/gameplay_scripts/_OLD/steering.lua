function Seek(metaNode, targetPos)
	-- print('seek')
	local node = metaNode.node

	-- print(node:getOrigin())
	-- print(node:getWorldTransform():getOrigin())
	-- print(targetPos)

	local desiredVelocity = (targetPos - node:getWorldTransform():getOrigin())
	return desiredVelocity:normalized() - node:getPhysicsBody():getVelocity()
end

function Flee(metaNode, targetPos)
end

function Arrive(metaNode, targetPos)
	local deceleration = 50.0

	local node = metaNode.node

	local toTarget = (targetPos - node:getWorldTransform():getOrigin())
	local dist = toTarget:length()

	if dist > 0 then
		local decelerationTweaker = 0.3

		local speed = dist / (deceleration * decelerationTweaker)

		local desiredVelocity = toTarget * speed / dist;

		return (desiredVelocity - node:getPhysicsBody():getVelocity())
	end

	return njli.btVector3(0,0,0)
end

function Pursuit(metaNode)
end

function Evade(metaNode)
end

function Wander(metaNode)
end

function ObstacleAvoidance(metaNode, obstacles)
end

function wallAvoidance(metaNode, walls)
end

function separation(metaNode, neighbors)
end

function alignment(metaNode, neghbors)
end

function cohesion(metaNode, neighbors)
end

function interpose(metaNode, metaNodeA, metaNodeB)
end

function hide(metaNode, hunterMetaNode, obstacles)
end

function followPath(metaNode, path)
end

function offsetPursuit(metaNode, leaderMetaNode, offset)
end


