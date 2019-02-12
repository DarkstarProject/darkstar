-----------------------------------
-- Area: Mount Zhayolm
--  ZNM: Brass Borer
-- TODO: Halting movement during stance change.
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/mobs")
----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
    mob:setLocalVar("formTime", os.time() + math.random(43, 47))
    mob:setLocalVar("defUp", math.random(25, 50))
    mob:setLocalVar("DEF", math.random(3, 5))
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onMobRoam(mob)
    local roamTime = mob:getLocalVar("formTime")

    if mob:AnimationSub() == 0 and os.time() > roamTime then
        mob:AnimationSub(1)
        mob:addMod(dsp.mod.MDEF, 10)
        mob:setLocalVar("formTime", os.time() + math.random(43, 47))
    elseif mob:AnimationSub() == 1 and os.time() > roamTime then
        mob:AnimationSub(0)
        mob:delMod(dsp.mod.MDEF, 10)
        mob:setLocalVar("formTime", os.time() + math.random(43, 47))
    end
end

function onMobFight(mob, target)
    local fightTime = mob:getLocalVar("formTime")

    if mob:AnimationSub() == 0 and os.time() > fightTime then
        mob:AnimationSub(1)
        mob:addMod(dsp.mod.MDEF, 10)
        mob:setLocalVar("formTime", os.time() + math.random(43, 47))
    elseif mob:AnimationSub() == 1 and os.time() > fightTime then
        mob:AnimationSub(0)
        mob:delMod(dsp.mod.MDEF, 10)
        mob:setLocalVar("formTime", os.time() + math.random(43, 47))
    end

    if mob:getHPP() < mob:getLocalVar("defUp") and mob:getLocalVar("usedMainSpec") <= mob:getLocalVar("DEF") then
        mob:useMobAbility(1815)
        mob:setLocalVar("usedMainSpec", mob:getLocalVar("usedMainSpec") +1)
    elseif mob:getLocalVar("usedMainSpec") >= 5 and mob:getLocalVar("Cannonball") == 0 then
        mob:useMobAbility(1818)
        mob:setLocalVar("Cannonball", 1)
    end
end

function onAdditionalEffect(mob, target, damage)
    return dsp.mob.onAddEffect(mob, target, damage, dsp.mob.ae.ENFIRE)
end

function onMobDeath(mob)
end