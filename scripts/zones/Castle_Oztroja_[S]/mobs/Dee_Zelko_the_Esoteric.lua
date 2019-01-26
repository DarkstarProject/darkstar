-----------------------------------
-- Area: Castle Oztroja (S)
--   NM: Dee Zelko the Esoteric
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.MAGIC_COOL, 14)
    mob:setMod(dsp.mod.UFASTCAST, 100)
end

function onMobFight(mob, target)
    -- Starts out with tier-1 Aero and Aeroga, but gradually increases magic tier
    -- as its HP declines, until it starts spamming insta-cast Tornado II.
    local hpp = mob:getHPP()

    if hpp < 25 then
        mob:setSpellList(244)
    elseif hpp < 40 then
        mob:setSpellList(243)
    elseif hpp < 55 then
        mob:setSpellList(242)
    elseif hpp < 70 then
        mob:setSpellList(241)
    elseif hpp < 85 then
        mob:setSpellList(240)
    else
        mob:setSpellList(239)
    end
end

function onMobDeath(mob, player, isKiller)
end

function onMobDespawn(mob)
    UpdateNMSpawnPoint(mob:getID())
    mob:setRespawnTime(math.random(7200, 14400)) -- 2 to 4 hours
end
