-----------------------------------
-- Area: East Ronfaure
--  NPC: Croteillard
-- Type: Gate Guard
-- !pos 87.426 -62.999 266.709 101
-----------------------------------
package.loaded["scripts/zones/East_Ronfaure/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/East_Ronfaure/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:showText(npc, CROTEILLARD_DIALOG);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

