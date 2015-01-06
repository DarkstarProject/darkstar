-----------------------------------
-- Area: Port San d'Oria
-- NPC:  
-----------------------------------

-----------------------------------


-----------------------------------
-- onSpawn
-----------------------------------
function onSpawn(npc)
    
    local transport = npc:getID();
    local door = npc:getID() - 3;
    
    local dock = { 20, -2, 44, 64 };
    local boundary = 369;
    
    local anim = { 18, 19};
    local Time = { 180, 360, 12, 60, 16 };
    
    local destination = 223;
    
    npc:setTransport(transport, door, dock[1], dock[2], dock[3], dock[4], boundary, anim[1], anim[2], Time[1], Time[2], Time[3], Time[4], Time[5], destination);
end;