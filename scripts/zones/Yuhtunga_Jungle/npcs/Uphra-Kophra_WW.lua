-----------------------------------
-- Area: Yuhtunga Jungle
--  NPC: Uphra-Kophra, W.W.
-- Outpost Conquest Guards
-- !pos -242.487 -1 -402.772 123
-----------------------------------
require("scripts/globals/conquest")
-----------------------------------

local guardNation = tpz.nation.WINDURST
local guardType   = tpz.conq.guard.OUTPOST
local guardRegion = tpz.region.ELSHIMOLOWLANDS
local guardEvent  = 32759

function onTrade(player,npc,trade)
    tpz.conq.overseerOnTrade(player, npc, trade, guardNation, guardType)
end

function onTrigger(player,npc)
    tpz.conq.overseerOnTrigger(player, npc, guardNation, guardType, guardEvent, guardRegion)
end

function onEventUpdate(player,csid,option)
    tpz.conq.overseerOnEventUpdate(player, csid, option, guardNation)
end

function onEventFinish(player,csid,option)
    tpz.conq.overseerOnEventFinish(player, csid, option, guardNation, guardType, guardRegion)
end