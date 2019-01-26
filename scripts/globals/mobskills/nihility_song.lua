---------------------------------------------
-- Nihility Song
-- Family: Hippogryph
-- Description: A song dispels a positive effect in an area of effect, including food.
-- Type: Enfeebling
-- Utsusemi/Blink absorb: Ignores shadows
-- Range: Radial 12.5'
-- Notes:
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local dispel =  target:dispelStatusEffect(bit.bor(dsp.effectFlag.DISPELABLE, dsp.effectFlag.FOOD))

    if (dispel == dsp.effect.NONE) then
        -- no effect
        skill:setMsg(dsp.msg.basic.SKILL_NO_EFFECT) -- no effect
    else
        skill:setMsg(dsp.msg.basic.SKILL_ERASE)
    end

    return dispel
end