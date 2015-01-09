-----------------------------------
-- Area: Selbina
-- NPC:  
-----------------------------------

-----------------------------------


-----------------------------------
-- onSpawn
-----------------------------------
function onSpawn(npc)
    
    -- selbina-mhaura boat
    local transport = npc:getID();
    local door = npc:getID() - 1;
    
    local dock = { 9.294, 0, -69.775, 0 };
    local boundary = 485;
    
    local anim = { 18, 19};
    local Time = { 372, 480, 18, 90, 17 };
    
    local destination = 220;
    
    npc:setTransport(transport, door, dock[1], dock[2], dock[3], dock[4], boundary, anim[1], anim[2], Time[1], Time[2], Time[3], Time[4], Time[5], destination);
end;