-----------------------------------
-- Area: Yughott Grotto
--  NPC: Mining Point
-----------------------------------
package.loaded["scripts/zones/Yughott_Grotto/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/mining");
require("scripts/zones/Yughott_Grotto/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    startMining(player,player:getZoneID(),npc,trade,0x0064);
end;

function onTrigger(player,npc)
    player:messageSpecial(MINING_IS_POSSIBLE_HERE,605);
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;