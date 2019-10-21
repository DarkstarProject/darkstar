-----------------------------------
-- Area: Appolyon
-- NPC:  Radiant_Aureole
-- !pos
-----------------------------------
require("scripts/globals/limbus");
require("scripts/globals/keyitems");

local ID = require("scripts/zones/Apollyon/IDs");



require("scripts/globals/bcnm")

function onTrade(player, npc, trade)
    TradeBCNM(player, npc, trade)
end

function onTrigger(player, npc)
   if npc:getID() == ID.npc.WEST_ENTRANCE then
      EventTriggerBCNM(player, npc, 1)
   else
      EventTriggerBCNM(player, npc, 2)
   end
end

function onEventUpdate(player, csid, option, extras)
    EventUpdateBCNM(player, csid, option, extras)
end

function onEventFinish(player, csid, option)
    EventFinishBCNM(player, csid, option)
end