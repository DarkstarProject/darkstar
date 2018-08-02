-----------------------------------
-- Area: Misareaux Coast
--  NPC: Logging Point
-----------------------------------
require("scripts/globals/logging");
local ID = require("scripts/zones/Misareaux_Coast/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    startLogging(player,player:getZoneID(),npc,trade,555);
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.LOGGING_IS_POSSIBLE_HERE,1021);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;