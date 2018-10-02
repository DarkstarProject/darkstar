-----------------------------------
-- Area: Port Windurst
--  NPC: Sachetan, I.M.
-- !pos -82 -5 165 z 240
-------------------------------------
require("scripts/globals/conquest")
-------------------------------------

local guardNation = dsp.nation.BASTOK
local guardType   = dsp.conq.guard.FOREIGN
local guardEvent  = 32761

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