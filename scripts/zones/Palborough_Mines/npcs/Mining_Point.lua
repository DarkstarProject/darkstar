-----------------------------------
-- Area: Palborough Mines
--  NPC: Mining Point
-----------------------------------
package.loaded["scripts/zones/Palborough_Mines/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/mining");
require("scripts/zones/Palborough_Mines/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    startMining(player,player:getZoneID(),npc,trade,120);
end;

function onTrigger(player,npc)
    player:messageSpecial(MINING_IS_POSSIBLE_HERE,605);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;