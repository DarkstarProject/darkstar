-----------------------------------
-- Area: Wajaom Woodlands
--  NPC: Harvesting Point
-----------------------------------
package.loaded["scripts/zones/Wajaom_Woodlands/TextIDs"] = nil;
package.loaded["scripts/globals/harvesting"] = nil;
-------------------------------------
require("scripts/globals/harvesting");
require("scripts/zones/Wajaom_Woodlands/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    startHarvesting(player,player:getZoneID(),npc,trade,0x01FB);
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