-----------------------------------
-- Area: Eastern Altepa Desert
--  NPC: Eulaclaire
-- Type: Chocobo Renter
-- !pos -55.715 3.949 232.524 114
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
