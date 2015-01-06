-----------------------------------
-- Area: Aht Urgan Whitegate
-- NPC:  
-----------------------------------

-----------------------------------


-----------------------------------
-- onSpawn
-----------------------------------
function onSpawn(npc)
    
    -- whitegate-nashmau boat
    local transport = npc:getID();
    local door = npc:getID() - 1;
    
    local dock = { 20.726, 3.389, 154.231, 128 };
    local boundary = 570;
    
    local anim = { 20, 21};
    local Time = { 282, 480, 18, 180, 16 };
    
    local destination = 59;
    
    npc:setTransport(transport, door, dock[1], dock[2], dock[3], dock[4], boundary, anim[1], anim[2], Time[1], Time[2], Time[3], Time[4], Time[5], destination);
    
    -- whitegate-mhaura boat
    door = door - 1;
    
    dock = { -20.726, 3.389, 154.231, 0 };
    boundary = boundary - 1;
    
    anim = { anim[1] - 2, anim[1] + 1 };
    Time = { 142, 480, 18, 80, 16 };
    
    destination = 47;
    
end;