-----------------------------------
-- Area: Port Jeuno
--  NPC: Narsha
-- Type: Chocobo Renter
-- !pos -2.51 8 -1 246
-----------------------------------
require("scripts/globals/chocobo")
-----------------------------------

local eventSucceed = 10003
local eventFail    = 10006

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    tpz.chocobo.renterOnTrigger(player, eventSucceed, eventFail)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    tpz.chocobo.renterOnEventFinish(player, csid, option, eventSucceed)
end
