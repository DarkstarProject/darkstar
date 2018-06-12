-----------------------------------
-- Area: Abyssea_Altepa
--  NPC: Bonarpant
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Abyssea-Altepa/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Abyssea-Altepa/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(336);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;