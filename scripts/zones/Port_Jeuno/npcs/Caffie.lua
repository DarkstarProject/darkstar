-----------------------------------
-- Area: Port Jeuno
--  NPC: Caffie
-- Type: Chocobo Renter
-- !pos -2.51 8 -1 246
-----------------------------------
require("scripts/globals/chocobo")
-----------------------------------

local eventSucceed = 10002
local eventFail    = 10005

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
