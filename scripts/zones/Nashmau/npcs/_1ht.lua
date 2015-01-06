-----------------------------------
-- Area: Nashmau
-- NPC:  
-----------------------------------

-----------------------------------


-----------------------------------
-- onSpawn
-----------------------------------
function onSpawn(npc)
    
    -- nashmau-whitegate boat
    local transport = npc:getID();
    local door = npc:getID() - 1;
    
    local dock = { 3.24, 3.389, -114.221, 128 };
    local boundary = 571;
    
    local anim = { 22, 23};
    local Time = { 282, 480, 18, 180, 16 };
    
    local destination = 59;
    
    npc:setTransport(transport, door, dock[1], dock[2], dock[3], dock[4], boundary, anim[1], anim[2], Time[1], Time[2], Time[3], Time[4], Time[5], destination);
end;