-----------------------------------
-- Area: Apollyon SW
--  Mob: Fire Elemental
-----------------------------------
require("scripts/globals/limbus")
-----------------------------------
local ID = require("scripts/zones/Apollyon/IDs")

function onMobDeath(mob, player, isKiller)
    if isKiller then
        if dsp.limbus.elementalsDead() then
            GetNPCByID(ID.npc.APOLLYON_SW_CRATE[4]):setStatus(dsp.status.NORMAL)
        end
    end
end