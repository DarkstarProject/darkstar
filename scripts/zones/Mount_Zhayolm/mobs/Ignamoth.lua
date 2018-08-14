-----------------------------------
-- Area: Mount Zhayolm
--  MOB: Ignamoth
-----------------------------------
require("scripts/globals/status")
-----------------------------------

function onMobSpawn(mob)
    mob:addMod(dsp.mod.DOUBLE_ATTACK, 50)
    mob:addMod(dsp.mod.REGAIN, 200)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onMobFight(mob,target)
end

function onAdditionalEffect(mob, target, damage)
    -- Todo adding damage on addition effect
    local resist = applyResistanceAddEffect(mob,player,dsp.magic.ele.ICE,dsp.effect.PARALYSIS)
    if resist <= 0.5 then
        return 0,0,0
    else
        local duration = 60
        local power = 20
        duration = duration * resist
        if not player:hasStatusEffect(dsp.effect.PARALYSIS) then
            player:addStatusEffect(dsp.effect.PARALYSIS, power, 0, duration)
        end
        return dsp.subEffect.PARALYSIS, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.PARALYSIS
    end
end

function onMobDeath(mob)
end
