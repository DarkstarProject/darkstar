-----------------------------------
-- Area: Apollyon SW
--  Mob: Water Elemental
-----------------------------------
require("scripts/globals/limbus")
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        if limbus.elementalsDead() then
            GetNPCByID(ID.npc.APOLLYON_SW_CRATE[4]):setStatus(dsp.status.NORMAL)
        end
    end
end