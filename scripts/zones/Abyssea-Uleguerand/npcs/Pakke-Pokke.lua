-----------------------------------
-- Area: Abyssea_Uleguerand
--  NPC: Pakke-Pokke
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Abyssea-Uleguerand/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Abyssea-Uleguerand/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(347);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;