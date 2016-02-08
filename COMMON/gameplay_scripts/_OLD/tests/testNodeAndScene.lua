
local node1 = njli.Node.create()
local rigidBody = njli.PhysicsBodyRigid.create()
rigidBody:setStaticPhysics()
--rigidBody:enableContactResponse(false)
node1:addPhysicsBody(rigidBody)

local node2 = njli.Node.create()
--node2:addPhysicsBody(njli.PhysicsBodyRigid.create())

local node3 = njli.Node.create()
--node3:addPhysicsBody(njli.PhysicsBodyRigid.create())

local node4 = njli.Node.create()
--node4:addPhysicsBody(njli.PhysicsBodyRigid.create())

nodeArray = {}    -- new array
for i=1, 1000 do
    print(i)
    nodeArray[i] = njli.Node.create()
    local body = njli.PhysicsBodyRigid.create()
body:setDynamicPhysics()
    nodeArray[i]:addPhysicsBody(body)
end


function MyWorldStateEnter()
end

function MyWorldStateUpdate(timeStep)

end

function MyWorldStateExit()
end

local body = nil

function MyWorldStateTouchDown(touch1, touch2, touch3, touch4, touch5)
    if (nodeArray[1]:hasPhysicsBody()) then
        body = nodeArray[1]:getPhysicsBody()
        nodeArray[1]:removePhysicsBody()
    else
        nodeArray[1]:addPhysicsBody(body)
    end
end

function MyWorldStateTouchUp(touch1, touch2, touch3, touch4, touch5)
end

function MyWorldStateTouchMove(touch1, touch2, touch3, touch4, touch5)
end

function MySceneMySceneStateEnter(scene)

--Test adding children before setting the root node...
    --node1:addChild(nodeArray[1])
    --node1:addChild(nodeArray[2])
    --node1:addChild(nodeArray[3])
    --node1:addChild(nodeArray[4])
    --node1:addChild(nodeArray[5])

    node1:setName("Node1")
    scene:setRootNode(node1)

    nodeArray[1]:setName("Node2")
    local root = scene:getRootNode()
    root:addChild(nodeArray[1])


--Test adding children after setting the root node...
    --scene:setRootNode(node2)
    --node1:addChild(nodeArray[6])
    --node1:addChild(nodeArray[7])
    --node1:addChild(nodeArray[8])
    --node1:addChild(nodeArray[9])
    --node1:addChild(nodeArray[10])

    --scene:setRootNode(node1)
end

function MySceneMySceneStateUpdate(scene, timeStep)
    --print(scene)
    print(nodeArray[1]:getWorldTransform():getOrigin())
end

function MySceneMySceneStateExit(scene)
end

function Node1CollideNode2(node1, node2, manifold)
    print(node1)
    print(node2)
    print(manifold)
end

function Node1NearNode2(node1, node2, dispatchInfo)
    print(node1)
    print(node2)
    print(dispatchInfo)
end