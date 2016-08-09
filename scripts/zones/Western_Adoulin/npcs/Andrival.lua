-----------------------------------
--  Area: Western Adoulin
--  NPC: Andrival
--  Type: Standard NPC
--  @zone 256
-- @pos 26 0 127
-----------------------------------
require("scripts/globals/missions");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local SOA_Mission = player:getCurrentMission(SOA);

    if (SOA_Mission == THE_MERCILESS_ONE) then
        -- Reminds player to accompany Ingrid to Castle Adoulin
        player:startEvent(0x008B);
    else
        -- Standard dialogue
        player:startEvent(0x0228);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)    
end;
