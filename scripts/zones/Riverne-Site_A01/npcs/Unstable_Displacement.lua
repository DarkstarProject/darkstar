-----------------------------------
-- Area: Riverne Site #A01
--  NPC: Unstable Displacement
-- ENM Battlefield
-----------------------------------
package.loaded["scripts/zones/Riverne-Site_A01/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/missions");
require("scripts/zones/Riverne-Site_A01/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)
    player:messageSpecial(SPACE_SEEMS_DISTORTED);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;