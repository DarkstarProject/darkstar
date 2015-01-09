-----------------------------------
-- Area: Manaclipper
-- NPC:  
-----------------------------------

-----------------------------------


-----------------------------------
-- onSpawn
-----------------------------------
function onSpawn(npc)
    
    local transport = npc:getID();
    local door = npc:getID() - 1;
    
    local dock = { 491.5, 0, 687.4, 128 };
    local boundary = 0;
    
    local anim = { 18, anim[1] + 1};
    local Time = { 0, 434, 20, 80, 20 };
    
    local destination = 3;
    
    npc:setTransport(transport, door, dock[1], dock[2], dock[3], dock[4], boundary, anim[1], anim[2], Time[1], Time[2], Time[3], Time[4], Time[5], destination);

    
    door = npc:getID() - 1;
    
    dock = { -392, 0, -364, 128 };
    boundary = 0;
    
    anim = { 20, anim[1] + 1};
    Time = { 300, 434, 20, 80, 20 };
    
    destination = 3;
    
    npc:setTransport(transport, door, dock[1], dock[2], dock[3], dock[4], boundary, anim[1], anim[2], Time[1], Time[2], Time[3], Time[4], Time[5], destination);
end;