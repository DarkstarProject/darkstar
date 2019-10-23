-----------------------------------
-- Area: Appolyon
-- NPC:  Radiant_Aureole
-- !pos
-----------------------------------
require("scripts/globals/bcnm")
local ID = require("scripts/zones/Apollyon/IDs")

function onTrade(player, npc, trade)
    TradeBCNM(player, npc, trade)
end

function onTrigger(player, npc)
   if npc:getID() == ID.npc.RADIANT_OFFSET then
      EventTriggerBCNM(player, npc)
   else
      EventTriggerBCNM(player, npc)
   end
end

function onEventUpdate(player, csid, option, extras)
    EventUpdateBCNM(player, csid, option, extras)
end

function onEventFinish(player, csid, option)
    EventFinishBCNM(player, csid, option)
end