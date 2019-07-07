-----------------------------------
-- Area: Balga's Dais
--   NM: Large Box
-- BCNM: Treasures and Tribulations
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function replaceWithCrate(mob)
    local crate = GetNPCByID(mob:getID() + 1)
    crate:teleport(mob:getPos(), mob:getRotPos())
    crate:setStatus(dsp.status.NORMAL)
end

function onMobInitialize(mob)
    mob:setMod(dsp.mod.ATTP, 25)
    mob:setMod(dsp.mod.DEFP, 25)
    mob:setMod(dsp.mod.EVA, -50)
end

function onMobEngaged (mob, target)
    local mobId = mob:getID()
    local small = GetMobByID(mobId - 2)

    if small:getLocalVar("engaged") == 0 then
        small:setLocalVar("engaged", 1)

        mob:setMobMod(dsp.mobMod.DRAW_IN, 1)
        DespawnMob(mobId - 2)
        DespawnMob(mobId - 1)

        if math.random(3) == 1 then
            DespawnMob(mobId)
            replaceWithCrate(mob)
        else
            mob:AnimationSub(1)
        end
    end
end

function onMobDeath(mob, player, isKiller)
    if isKiller then
        replaceWithCrate(mob)
    end
end
