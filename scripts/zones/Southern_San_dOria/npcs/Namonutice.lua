-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Namonutice
--  Fame Checker
--  @zone 230
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)

end;

function onTrigger(player,npc)
    player:startEvent(31, player:getFame(SANDORIA));
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;



