-----------------------------------
-- Area: Meriphataud Mountains [S]
--  NPC: Lidaise
-- Type: Chocobo Renter
-- !pos 312.021 -10.921 28.494 97
-----------------------------------
require("scripts/globals/chocobo")
-----------------------------------

local eventSucceed = 106
local eventFail    = 107

function onTrade(player, npc, trade)
end

function onTrigger(player, npc)
    tpz.chocobo.renterOnTrigger(player, eventSucceed, eventFail)
end

function onEventUpdate(player, csid, option)
end

function onEventFinish(player, csid, option)
    tpz.chocobo.renterOnEventFinish(player, csid, option, eventSucceed)
end
