-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Aravoge, T.K.
-------------------------------------
require("scripts/globals/conquest")
-------------------------------------

local guardNation = dsp.nation.SANDORIA
local guardType   = dsp.conq.guard.CITY  
local guardEvent  = 32762

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
