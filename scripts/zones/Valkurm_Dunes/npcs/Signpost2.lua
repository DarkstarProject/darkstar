-----------------------------------
-- Area: Valkurm Dunes
--  NPC: Signpost
-- !pos 490 -13 146 103
-----------------------------------
package.loaded["scripts/zones/Valkurm_Dunes/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Valkurm_Dunes/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:messageSpecial(SIGNPOST2);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;