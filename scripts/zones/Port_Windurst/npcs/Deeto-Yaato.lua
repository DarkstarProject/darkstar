-----------------------------------
-- Area: Port Windurst
--  NPC: Deeto-Yaato
-- Working 100%
-----------------------------------
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(336);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
