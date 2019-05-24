-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Jeanvirgaud
-- Outpost Teleporter NPC
-- !pos 111 -0.199 -6 231
-----------------------------------
require("scripts/globals/conquest")
-----------------------------------

local teleporterNation = dsp.nation.SANDORIA
local teleporterEvent  = 716

function onTrigger(player,npc)
    dsp.conquest.teleporterOnTrigger(player, teleporterNation, teleporterEvent)
end

function onEventUpdate(player,csid,option)
    dsp.conquest.teleporterOnEventUpdate(player, csid, option, teleporterEvent)
end

function onEventFinish(player,csid,option)
    dsp.conquest.teleporterOnEventFinish(player, csid, option, teleporterEvent)
end
