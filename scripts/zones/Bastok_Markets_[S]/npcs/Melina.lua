-----------------------------------
-- Area: Bastok Markets [S]
--  NPC: Melina
-- Type: Chocobo Renter
-- !pos -210.667 0.000 75.819 87
-----------------------------------
require("scripts/globals/chocobo")
-----------------------------------

local eventSucceed = 6
local eventFail    = 7

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
