-----------------------------------
-- Area: Kazham-Jeuno Airship
-- NPC:  
-----------------------------------

-----------------------------------


-----------------------------------
-- onSpawn
-----------------------------------
function onSpawn(npc)
    
    local transport = npc:getID();
    local door = npc:getID() - 1;
    
    local dock = { -4, -3.497, 321.125, 128 };
    local boundary = 512;
    
    local anim = { 18, 19 };
    local Time = { 90, 360, 20, 50, 20 };
    
    local destination = 226;
    
    npc:setTransport(transport, door, dock[1], dock[2], dock[3], dock[4], boundary, anim[1], anim[2], Time[1], Time[2], Time[3], Time[4], Time[5], destination);
end;