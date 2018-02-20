-----------------------------------
-- Area: Chateau d'Oraguille
--  NPC: Chupaile
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Chateau_dOraguille/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Chateau_dOraguille/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(514);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

