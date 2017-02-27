-----------------------------------
--  Area: Western Adoulin
--  NPC: Berstrogus
--  Type: Standard NPC
--  @zone 256
-- @pos -44 4 -10
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

    if (SOA_Mission >= LIFE_ON_THE_FRONTIER) then
        -- Standard dialogue, after joining colonization effort
        player:startEvent(0x024B);
    else
        -- Dialogue prior to joining colonization effort
        player:startEvent(0x01F8);
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
