-----------------------------------------
-- Sleepga
-----------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/status")
require("scripts/globals/magic")
require("scripts/globals/msg")
-----------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0
end

function onPetAbility(target, pet, skill)
    local duration = 60
    local resm = applyPlayerResistance(pet,-1,target,pet:getStat(dsp.mod.INT)-target:getStat(dsp.mod.INT),dsp.skill.ELEMENTAL_MAGIC, 5)
    if (resm < 0.5) then
        skill:setMsg(dsp.msg.basic.RESIST) -- resist message
        return dsp.effect.SLEEP_I
    end
    duration = duration * resm
    if (target:hasImmunity(1) or hasSleepEffects(target)) then
        --No effect
        skill:setMsg(dsp.msg.basic.SKILL_NO_EFFECT)
    else
        skill:setMsg(dsp.msg.basic.SKILL_ENFEEB)

        target:addStatusEffect(dsp.effect.SLEEP_I,1,0,duration)
    end

    return dsp.effect.SLEEP_I
end
