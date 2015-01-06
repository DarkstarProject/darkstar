-----------------------------------
-- Area: Port Bastok
-- NPC:  
-----------------------------------

-----------------------------------


-----------------------------------
-- onSpawn
-----------------------------------
function onSpawn(npc)
    
    local transport = npc:getID();
    local door = npc:getID() - 6;
    
    local dock = { -36.458, 6.365, -77.322, 128 };
    local boundary = 315;
    
    local anim = { 18, 19};
    local Time = { 0, 360, 14, 60, 16 };
    
    local destination = 224;
    
    npc:setTransport(transport, door, dock[1], dock[2], dock[3], dock[4], boundary, anim[1], anim[2], Time[1], Time[2], Time[3], Time[4], Time[5], destination);
end;