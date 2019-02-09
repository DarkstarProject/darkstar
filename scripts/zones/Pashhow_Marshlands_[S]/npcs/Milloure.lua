-----------------------------------
-- Area: Pashhow Marshlands [S]
--  NPC: Milloure
-- Type: Chocobo Renter
-- !pos 336.765 24.416 -124.592 90
-----------------------------------
require("scripts/globals/chocobo")
-----------------------------------

local eventSucceed = 103
local eventFail    = 104

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    dsp.chocobo.renterOnTrigger(player, eventSucceed, eventFail)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    dsp.chocobo.renterOnEventFinish(player, csid, option, eventSucceed)
end
