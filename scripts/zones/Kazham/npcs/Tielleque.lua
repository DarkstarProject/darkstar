-----------------------------------
-- Area: Kazham
--  NPC: Tielleque
-- Type: Chocobo Renter
-- !pos -55.339 -9.999 -94.936 250
-----------------------------------
require("scripts/globals/chocobo")
-----------------------------------

local eventSucceed = 10016
local eventFail    = 10017

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
