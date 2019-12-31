-----------------------------------
-- Area: Jugner Forest
--   NM: King Arthro
-----------------------------------
mixins =
{
    require("scripts/mixins/job_special"),
    require("scripts/mixins/rage")
}
require("scripts/globals/mobs")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    local KingArthroID = mob:getID()

    -- Use King Arthro ID to determine Knight Crab Id's, then set their respawn to 0 so they don't spawn while KA is up
    for offset = 1, 10 do
        GetMobByID(KingArthroID - offset):setRespawnTime(0)
    end
end

function onAdditionalEffect(mob, target, damage)
    if mob:hasStatusEffect(dsp.effect.ENWATER) then
        return 0, 0, 0
    else
        return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.PARALYZE)
    end
end

function onMonsterMagicPrepare(mob, target)
    -- Instant cast on spells - Waterga IV, Poisonga II, Drown, and Enwater
    local rnd = math.random()

    if rnd < 0.2 then
        return 202 -- Waterga IV
    elseif rnd < 0.6 then
        return 226 -- Poisonga II
    elseif rnd < 0.8 then
        return 240 -- Drown
    else
        return 105 -- Enwater
    end
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    local KingArthroID = mob:getID()

    GetMobByID(KingArthroID):setLocalVar("[POP]King_Arthro", 0)

    -- Set respawn of 21:05 to 24:05
    local respawnTime = math.random(21, 24) * 3600 + 300
    for offset = 1, 10 do
        GetMobByID(KingArthroID - offset):setRespawnTime(respawnTime)
    end
end
