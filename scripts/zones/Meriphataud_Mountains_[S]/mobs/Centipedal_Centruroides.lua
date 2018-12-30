-----------------------------------
-- Area: Meriphataud Mountains [S]
--   NM: Centipedal Centruroides
-----------------------------------
require("scripts/globals/status")
require("scripts/globals/magic")
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(dsp.mobMod.ADD_EFFECT, 1)
end

function onMobSpawn(mob)
    mob:addMod(dsp.mod.MOVE, 13)
end

function onAdditionalEffect(mob, player)
    local chance = 40
    local resist = applyResistanceAddEffect(mob, player, dsp.magic.ele.WATER, dsp.effect.POISON)
    if math.random(0, 99) >= chance or resist <= 0.5 then
        return 0, 0, 0
    else
        local duration = 30
        if mob:getMainLvl() > player:getMainLvl() then
            duration = duration + mob:getMainLvl() - player:getMainLvl()
        end
        duration = utils.clamp(duration, 1, 30)
        duration = duration * resist
        if not player:hasStatusEffect(dsp.effect.POISON) then
            player:addStatusEffect(dsp.effect.POISON, 30, 3, duration)
        end
        return dsp.subEffect.POISON, dsp.msg.basic.ADD_EFFECT_STATUS, dsp.effect.POISON
    end
end

function onMobDeath(mob, player, isKiller)
end
