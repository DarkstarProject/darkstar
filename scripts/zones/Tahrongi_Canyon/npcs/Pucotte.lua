-----------------------------------
-- Area: Tahrongi Canyon
--  NPC: Pucotte
-- Type: Chocobo Renter
-- !pos 101.591 39.999 360.898 117
-----------------------------------
require("scripts/globals/chocobo")
-----------------------------------

local eventSucceed = 910
local eventFail    = 911

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
