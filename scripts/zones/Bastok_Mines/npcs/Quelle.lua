-----------------------------------
-- Area: Bastok Mines
--  NPC: Quelle
-- Type: Chocobo Renter
-- !pos 33.998 0.750 -108.625 234
-----------------------------------
require("scripts/globals/chocobo")
-----------------------------------

local eventSucceed = 63
local eventFail    = 66

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
