-----------------------------------
-- Area: Palborough Mines
--  NPC: Mining Point
-----------------------------------
require("scripts/globals/mining");
local ID = require("scripts/zones/Palborough_Mines/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    startMining(player,player:getZoneID(),npc,trade,120);
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.MINING_IS_POSSIBLE_HERE,605);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;