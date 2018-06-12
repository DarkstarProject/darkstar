-----------------------------------
-- Area: Windurst Waters
--  NPC: Anja-Enja
-- Adventurer's Assistant
-- Working 100%
-------------------------------------
require("scripts/globals/settings");
package.loaded["scripts/zones/Windurst_Waters/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Windurst_Waters/TextIDs");

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(278);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;



