-----------------------------------
-- Area: Northern Sand Oria
--  NPC: Chapal-Afal, W.W.
-- !pos -55 -2 31 231
-------------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil
-------------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs")
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