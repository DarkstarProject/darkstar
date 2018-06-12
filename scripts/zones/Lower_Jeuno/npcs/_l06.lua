-----------------------------------
-- Area: Lower Jeuno
--  NPC: Streetlamp
-- Involved in Quests: Community Service
-- !pos -60 5 -75 245
-----------------------------------
require("scripts/zones/Lower_Jeuno/globals");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    LOWER_JEUNO.lampTrigger(player, npc);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
    LOWER_JEUNO.lampEventFinish(player, csid, option, 6);
end;
