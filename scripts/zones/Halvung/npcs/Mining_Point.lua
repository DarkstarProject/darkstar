-----------------------------------
-- Area: Halvung
--  NPC: Mining Point
-----------------------------------
package.loaded["scripts/zones/Halvung/TextIDs"] = nil;
-------------------------------------
require("scripts/zones/Halvung/TextIDs");
require("scripts/globals/mining");
-----------------------------------

function onTrade(player,npc,trade)
    startMining(player, player:getZoneID(), npc, trade, 210);
end;

function onTrigger(player,npc)
    player:messageSpecial(MINING_IS_POSSIBLE_HERE, 605);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
