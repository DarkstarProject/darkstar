-----------------------------------
-- Area: Mhaura
-- NPC:  
-----------------------------------

-----------------------------------


-----------------------------------
-- onSpawn
-----------------------------------
function onSpawn(npc)
    
    -- mhaura-selbina boat
    local transport = npc:getID();
    local door = npc:getID() - 1;
    
    local dock = { -0.516, 0.004, -8.409, 0 };
    local boundary = 493;
    
    local anim = { 18, 19 };
    local Time = { 372, 480, 18, 90, 17 };
    
    local destination = 221;
    
    npc:setTransport(transport, door, dock[1], dock[2], dock[3], dock[4], boundary, anim[1], anim[2], Time[1], Time[2], Time[3], Time[4], Time[5], destination);

    -- mhaura-whitegate boat
    Time = { 142, 480, 18, 80, 17 };
    
    destination = 46;
    
    npc:setTransport(transport, door, dock[1], dock[2], dock[3], dock[4], boundary, anim[1], anim[2], Time[1], Time[2], Time[3], Time[4], Time[5], destination);
end;