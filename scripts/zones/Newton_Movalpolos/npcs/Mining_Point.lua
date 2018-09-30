-----------------------------------
-- Area: Newton Movalpolos
--  NPC: Mining Point
-----------------------------------
require("scripts/globals/mining");
local ID = require("scripts/zones/Newton_Movalpolos/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    startMining(player,player:getZoneID(),npc,trade,10);
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.MINING_IS_POSSIBLE_HERE,605);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;