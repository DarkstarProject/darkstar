-----------------------------------
-- Area: Yhoator Jungle
--  NPC: Logging Point
-----------------------------------
require("scripts/globals/logging");
local ID = require("scripts/zones/Yhoator_Jungle/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    startLogging(player,player:getZoneID(),npc,trade,10);
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.LOGGING_IS_POSSIBLE_HERE,1021);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;