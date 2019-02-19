----------------------------------
-- Area: Jugner_Forest
--   NM: Giollemitte B Feroun
-- Involved in Quest: A Timely Visit
-----------------------------------
mixins = {require("scripts/mixins/job_special")}
require("scripts/globals/status")
require("scripts/globals/msg")
-----------------------------------

function onMobInitialize(mob)

    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 300) -- 5 minutes
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
    
end

function onMobSpawn(mob)

    mob:addMod(dsp.mod.SILENCERES, 80)
    mob:addMod(dsp.mod.SLEEPRES, 50)
    mob:addMod(dsp.mod.LULLABYRES, 50)
    mob:addMod(dsp.mod.MDEF, 50)
    DespawnMob(mob:getID(), 300)
    
    dsp.mix.jobSpecial.config(mob, {
        specials =
        {
            {id = dsp.jsa.INVINCIBLE, hpp = 25},
        },
    })

end

function onAdditionalEffect(mob, target, damage)
end

function onMobFight(mob, target)

    --if mob:getHPP() <= 25 and mob:getLocalVar("invincible") == 0 then
    --    mob:useMobAbility(694)
    --    mob:setLocalVar("invincible", 1)
    --end

end

function onMobDeath(mob, player, isKiller)

    local aTimelyVisit = player:getQuestStatus(SANDORIA, A_TIMELY_VISIT)
    local aTimelyVisitStep = player:getVar("aTimelyVisitStep")

    if aTimelyVisit == QUEST_ACCEPTED and aTimelyVisitStep == 7 then
        player:setVar("aTimelyVisitStep", 8)
    end

end

function onMobDespawn(mob)
end
