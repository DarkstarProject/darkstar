-----------------------------------
-- Area: Temenos
-- NPC:  Particle_Gate
-----------------------------------
require("scripts/globals/limbus")

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local GateID =  npc:getID()
    
    switch (GateID): caseof 
    {
         -- 100-106 : Northern Tower
        [GATE_OFFSET]    = function() player:startEvent(100) end,
        [GATE_OFFSET+1]  = function() player:startEvent(101) end,
        [GATE_OFFSET+2]  = function() player:startEvent(102) end,
        [GATE_OFFSET+3]  = function() player:startEvent(103) end,
        [GATE_OFFSET+4]  = function() player:startEvent(104) end,
        [GATE_OFFSET+5]  = function() player:startEvent(105) end,
        [GATE_OFFSET+6]  = function() player:startEvent(106) end,
        -- 107-113 : Eastern Tower
        [GATE_OFFSET+7]  = function() player:startEvent(107) end,
        [GATE_OFFSET+8]  = function() player:startEvent(108) end,
        [GATE_OFFSET+9]  = function() player:startEvent(109) end,
        [GATE_OFFSET+10] = function() player:startEvent(110) end,
        [GATE_OFFSET+11] = function() player:startEvent(111) end,
        [GATE_OFFSET+12] = function() player:startEvent(112) end,
        [GATE_OFFSET+13] = function() player:startEvent(113) end,
        -- 114-120 Western Tower
        [GATE_OFFSET+14] = function() player:startEvent(114) end,
        [GATE_OFFSET+15] = function() player:startEvent(115) end,
        [GATE_OFFSET+16] = function() player:startEvent(116) end,
        [GATE_OFFSET+17] = function() player:startEvent(117) end,
        [GATE_OFFSET+18] = function() player:startEvent(118) end,
        [GATE_OFFSET+19] = function() player:startEvent(119) end,
        [GATE_OFFSET+20] = function() player:startEvent(120) end,
        -- The rest of Temenos
        [GATE_OFFSET+21] = function() player:startEvent(120) end,
        [GATE_OFFSET+22] = function() player:startEvent(120) end,
        [GATE_OFFSET+23] = function() player:startEvent(120) end,
        [GATE_OFFSET+24] = function() player:startEvent(120) end,
        [GATE_OFFSET+25] = function() player:startEvent(120) end,
    }
end

function onEventUpdate(player,csid,option)  
end

function onEventFinish(player,csid,option)
end
