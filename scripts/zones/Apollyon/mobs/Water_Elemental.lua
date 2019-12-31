-----------------------------------
-- Area: Apollyon SW
--  Mob: Water Elemental
-----------------------------------
require("scripts/globals/limbus")
local ID = require("scripts/zones/Apollyon/IDs")

function onMobEngaged(mob, target)
    GetMobByID(ID.mob.APOLLYON_SW_MOB[4]+6):updateEnmity(target)
    GetMobByID(ID.mob.APOLLYON_SW_MOB[4]+14):updateEnmity(target)
    GetMobByID(ID.mob.APOLLYON_SW_MOB[4]+22):updateEnmity(target)
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        if dsp.limbus.elementalsDead() then
            GetNPCByID(ID.npc.APOLLYON_SW_CRATE[4]):setStatus(dsp.status.NORMAL)
        end
    end
end