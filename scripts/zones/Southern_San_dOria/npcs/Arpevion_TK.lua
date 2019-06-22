-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Arpevion, T.K.
-- !pos 105.163 0.000 -52.980 230
-------------------------------------
require("scripts/globals/conquest")
-------------------------------------

local guardNation = dsp.nation.SANDORIA
local guardType   = dsp.conq.guard.CITY  
local guardEvent  = 32763

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
