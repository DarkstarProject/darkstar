-----------------------------------
-- Area: Newton Movalpolos
--  NPC: Mining Point
-----------------------------------
package.loaded["scripts/zones/Newton_Movalpolos/TextIDs"] = nil;
-------------------------------------
require("scripts/globals/mining");
require("scripts/zones/Newton_Movalpolos/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
    startMining(player,player:getZoneID(),npc,trade,10);
end;

function onTrigger(player,npc)
    player:messageSpecial(MINING_IS_POSSIBLE_HERE,605);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;