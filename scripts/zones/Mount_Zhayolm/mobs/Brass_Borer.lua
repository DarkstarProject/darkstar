-----------------------------------
-- Area: Mount Zhayolm
--  ZNM: Brass Borer
-----------------------------------
mixins = {require("scripts/mixins/rage")}
require("scripts/globals/status")
----------------------------------
-- TODO: Halting movement during stance change. Stack Amber Scutum Def Boost effects for super cannonball
function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.IDLE_DESPAWN, 300)
end

function onMobSpawn(mob)
    mob:setLocalVar("[rage]timer", 3600) -- 60 minutes
    mob:setLocalVar("formTime", os.time() + math.random(43,47))
    mob:setLocalVar("defUp", math.random(25,50))
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onMobRoam(mob)
    local roamTime = mob:getLocalVar("formTime")
    if (mob:AnimationSub() == 0 and os.time() > roamTime) then
        mob:AnimationSub(1)
        mob:addMod(dsp.mod.MDEF,10)
        mob:setLocalVar("formTime", os.time() + math.random(43,47))
    elseif (mob:AnimationSub() == 1 and os.time() > roamTime) then
        mob:AnimationSub(0)
        mob:delMod(dsp.mod.MDEF,10)
        mob:setLocalVar("formTime", os.time() + math.random(43,47))
    end
end

function onMobFight(mob,target)
    local fightTime = mob:getLocalVar("formTime")
    if (mob:AnimationSub() == 0 and os.time() > fightTime) then
        mob:AnimationSub(1)
        mob:addMod(dsp.mod.MDEF,10)
        mob:setLocalVar("formTime", os.time() + math.random(43,47))
    elseif (mob:AnimationSub() == 1 and os.time() > fightTime) then
        mob:AnimationSub(0)
        mob:delMod(dsp.mod.MDEF,10)
        mob:setLocalVar("formTime", os.time() + math.random(43,47))
    end
    if mob:getHPP() < mob:getLocalVar("defUp") and mob:getLocalVar("usedMainSpec") <= 5 then
        mob:useMobAbility(1815)
        mob:setLocalVar("usedMainSpec", mob:getLocalVar("usedMainSpec") +1)
    elseif mob:getLocalVar("usedMainSpec") >= 5 and mob:getLocalVar("Cannonball") == 0 then
        mob:useMobAbility(1818)
        mob:setLocalVar("Cannonball",1)
    end
end

function onAdditionalEffect(mob, target, damage)
    local dmg = math.random(15,30)
    local params = {}
    params.bonusmab = 0
    params.includemab = false

    dmg = addBonusesAbility(mob, dsp.magic.ele.FIRE, target, dmg, params)
    dmg = dmg * applyResistanceAddEffect(mob,target,dsp.magic.ele.FIRE,0)
    dmg = adjustForTarget(target,dmg,dsp.magic.ele.FIRE)
    dmg = finalMagicNonSpellAdjustments(mob,target,dsp.magic.ele.FIRE,dmg)

    return dsp.subEffect.FIRE_DAMAGE, dsp.msg.basic.ADD_EFFECT_DMG, dmg
end

function onMobDeath(mob)
end