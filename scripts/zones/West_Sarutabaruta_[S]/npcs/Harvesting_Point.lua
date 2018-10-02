-----------------------------------
-- Area: West Sarutabaruta [S]
--  NPC: Harvesting Point
-----------------------------------
require("scripts/globals/harvesting");
local ID = require("scripts/zones/West_Sarutabaruta_[S]/IDs");
-----------------------------------

function onTrade(player,npc,trade)
    startHarvesting(player,player:getZoneID(),npc,trade,901);
end;

function onTrigger(player,npc)
    player:messageSpecial(ID.text.HARVESTING_IS_POSSIBLE_HERE,1020);
end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;