-----------------------------------
-- Area: Metalworks
--  NPC: Lexun-Maxirun, W.W.
-- !pos 28 -16 28 237
-------------------------------------
require("scripts/globals/conquest")
-------------------------------------

local guardNation = dsp.nation.WINDURST
local guardType   = dsp.conq.guard.FOREIGN
local guardEvent  = 32759

function onTrade(player,npc,trade)
    dsp.conq.overseerOnTrade(player, npc, trade, guardNation, guardType)
end

function onTrigger(player,npc)
    dsp.conq.overseerOnTrigger(player, npc, guardNation, guardType, guardEvent)
end

function onEventUpdate(player,csid,option)
    dsp.conq.overseerOnEventUpdate(player, csid, option, guardNation)
end

function onEventFinish(player,csid,option)
    dsp.conq.overseerOnEventFinish(player, csid, option, guardNation, guardType)
end