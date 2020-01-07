-----------------------------------
-- Area: Jugner Forest (S)
--  NPC: Helmyre
-- Type: Chocobo Renter
-- !pos -120.853 0.000 -152.582 82
-----------------------------------
require("scripts/globals/chocobo")
-----------------------------------

local eventSucceed = 208
local eventFail    = 209

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
