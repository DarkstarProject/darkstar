-----------------------------------
-- Area: Fort Karugo-Narugo [S]
--  NPC: Logging Point
-----------------------------------
local ID = require("scripts/zones/Fort_Karugo-Narugo_[S]/IDs");
require("scripts/globals/logging");
-----------------------------------

function onTrade(player,npc,trade)
    startLogging(player,player:getZoneID(),npc,trade,901);
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.LOGGING_IS_POSSIBLE_HERE,1021);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
