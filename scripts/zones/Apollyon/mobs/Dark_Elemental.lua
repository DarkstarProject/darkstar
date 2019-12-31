-----------------------------------
-- Area: Apollyon SW
--  Mob: Dark Elemental
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Apollyon/IDs")

function onMobEngaged(mob, target)
    GetMobByID(ID.mob.APOLLYON_SW_MOB[4]+1):updateEnmity(target)
    GetMobByID(ID.mob.APOLLYON_SW_MOB[4]+9):updateEnmity(target)
    GetMobByID(ID.mob.APOLLYON_SW_MOB[4]+17):updateEnmity(target)
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        if dsp.limbus.elementalsDead() then
            GetNPCByID(ID.npc.APOLLYON_SW_CRATE[4]):setStatus(dsp.status.NORMAL)
        end
    end
end