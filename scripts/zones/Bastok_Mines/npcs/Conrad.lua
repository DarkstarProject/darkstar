-----------------------------------
-- Area: Bastok Mines
--  NPC: Conrad
-- Outpost Teleporter NPC
-- !pos 94.457 -0.375 -66.161 234
-----------------------------------
require("scripts/globals/conquest")
-----------------------------------

local teleporterNation = dsp.nation.BASTOK
local teleporterEvent  = 581

function onTrigger(player,npc)
    dsp.conquest.teleporterOnTrigger(player, teleporterNation, teleporterEvent)
end

function onEventUpdate(player,csid,option)
    dsp.conquest.teleporterOnEventUpdate(player, csid, option, teleporterEvent)
end

function onEventFinish(player,csid,option)
    dsp.conquest.teleporterOnEventFinish(player, csid, option, teleporterEvent)
end
