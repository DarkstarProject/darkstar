-----------------------------------
-- Area: Port Windurst
--  NPC: Rottata
-- Outpost Teleporter NPC
-- !pos 193.111 -12.999 215.638 240
-----------------------------------
require("scripts/globals/conquest")
-----------------------------------

local teleporterNation = dsp.nation.WINDURST
local teleporterEvent  = 552

function onTrigger(player,npc)
    dsp.conquest.teleporterOnTrigger(player, teleporterNation, teleporterEvent)
end

function onEventUpdate(player,csid,option)
    dsp.conquest.teleporterOnEventUpdate(player, csid, option, teleporterEvent)
end

function onEventFinish(player,csid,option)
    dsp.conquest.teleporterOnEventFinish(player, csid, option, teleporterEvent)
end
