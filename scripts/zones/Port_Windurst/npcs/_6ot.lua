-----------------------------------
-- Area: Port Windurst
-- NPC:  
-----------------------------------

-----------------------------------


-----------------------------------
-- onSpawn
-----------------------------------
function onSpawn(npc)
    
    local transport = npc:getID();
    local door = npc:getID() - 1;
    
    local dock = { 242.281, -3.522, 61.994, 96 };
    local boundary = 416;
    
    local anim = { 18, 19};
    local Time = { 270, 360, 18, 60, 14 };
    
    local destination = 225;
    
    npc:setTransport(transport, door, dock[1], dock[2], dock[3], dock[4], boundary, anim[1], anim[2], Time[1], Time[2], Time[3], Time[4], Time[5], destination);
end;