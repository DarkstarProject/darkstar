-----------------------------------
-- Area: Yhoator Jungle
--  NPC: Paurelde
-- Type: Chocobo Renter
-- !pos -273.301 0.300 -149.800 124
-----------------------------------
require("scripts/globals/chocobo")
-----------------------------------

local eventSucceed = 12
local eventFail    = 13

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    dsp.chocobo.renterOnTrigger(player, eventSucceed, eventFail)
end

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    dsp.chocobo.renterOnEventFinish(player, csid, option, eventSucceed)
end
