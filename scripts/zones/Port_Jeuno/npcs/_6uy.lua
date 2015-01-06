-----------------------------------
-- Area: Port Jeuno
-- NPC:  
-----------------------------------

-----------------------------------

-----------------------------------
-- onSpawn
-----------------------------------
function onSpawn(npc)
    
    -- jeuno-kazham airship
    local transport = npc:getID();
    local door = npc:getID() - 1;

    local dock = { -4, 10.45, 117, 64 };
    local boundary = 477;

    local anim = { 24, 25 };
    local Time = { 270, 360, 20, 50, 20 };

    local destination = 226;
    
    npc:setTransport(transport, door, dock[1], dock[2], dock[3], dock[4], boundary, anim[1], anim[2], Time[1], Time[2], Time[3], Time[4], Time[5], destination);
    
    -- jeuno-windurst airship
    door = door - 1;
    
    dock = { -6, dock[2], -117, 192 };
    boundary = boundary - 1;
    
    anim = { anim[1] - 2, anim[1] + 1 };
    Time = { 90, Time[2], 12, 60, 12 };
    
    destination = destination - 1;
    
    npc:setTransport(transport, door, dock[1], dock[2], dock[3], dock[4], boundary, anim[1], anim[2], Time[1], Time[2], Time[3], Time[4], Time[5], destination);
    
    -- jeuno-bastok airship
    door = door - 1;
    
    dock = { -70, dock[2], -117, 192 };
    boundary = boundary - 1;
    
    anim = { anim[1] - 2, anim[1] + 1 };
    Time = { 180, Time[2], 12, 60, 16 };
    
    destination = destination -1;
    
    npc:setTransport(transport, door, dock[1], dock[2], dock[3], dock[4], boundary, anim[1], anim[2], Time[1], Time[2], Time[3], Time[4], Time[5], destination);
    
    -- jeuno-sandoria airship
    door = door - 1;
    
    dock = { -68, dock[2], 117, 64 };
    boundary = boundary - 1;
    
    anim = { anim[1] - 2, anim[1] + 1 };
    Time = { 0, Time[2], 12, 60, 12 };
    
    destination = destination - 1;
    
    npc:setTransport(transport, door, dock[1], dock[2], dock[3], dock[4], boundary, anim[1], anim[2], Time[1], Time[2], Time[3], Time[4], Time[5], destination);
end;