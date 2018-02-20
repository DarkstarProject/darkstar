-----------------------------------
-- Area: Chocobo_Circuit
--  NPC: Delaulne
-- Standard Info NPC
-----------------------------------
package.loaded["scripts/zones/Chocobo_Circuit/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Chocobo_Circuit/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:startEvent(340);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;