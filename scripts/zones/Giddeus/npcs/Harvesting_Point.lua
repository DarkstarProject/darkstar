-----------------------------------
-- Area: Giddeus
--  NPC: Harvesting Point
-----------------------------------
package.loaded["scripts/zones/Giddeus/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/harvesting");
require("scripts/zones/Giddeus/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    startHarvesting(player,player:getZoneID(),npc,trade,0x0046);
end;

function onTrigger(player,npc)
    player:messageSpecial(HARVESTING_IS_POSSIBLE_HERE,1020);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;