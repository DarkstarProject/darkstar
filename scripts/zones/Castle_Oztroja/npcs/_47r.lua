-----------------------------------
-- Area: Castle Oztroja
--  NPC: _47r
-- !pos 20.000 24.168 -25.000 151
-----------------------------------
package.loaded["scripts/zones/Castle_Oztroja/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Castle_Oztroja/TextIDs");
-----------------------------------

function onTrigger(player,npc)
    player:messageSpecial(PROBABLY_WORKS_WITH_SOMETHING_ELSE);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;