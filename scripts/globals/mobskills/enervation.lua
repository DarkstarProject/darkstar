---------------------------------------------
-- Enervation
--
-- Description: Lowers the defense and magical defense of enemies within range.
-- Type: Magical (Dark)
---------------------------------------------
require("scripts/globals/monstertpmoves")
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/msg")
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
  if (mob:getFamily() == 91) then
    local mobSkin = mob:getModelId()

    if (mobSkin == 1680) then
        return 0
    else
        return 1
    end
  end
    return 0
end

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effect.DEFENSE_DOWN

    local silenced = false
    local blinded = false

    silenced = MobStatusEffectMove(mob, target, dsp.effect.DEFENSE_DOWN, 10, 0, 120)

    blinded = MobStatusEffectMove(mob, target, dsp.effect.MAGIC_DEF_DOWN, 8, 0, 120)

    skill:setMsg(dsp.msg.basic.SKILL_ENFEEB_IS)

    -- display silenced first, else blind
    if (silenced == dsp.msg.basic.SKILL_ENFEEB_IS) then
        typeEffect = dsp.effect.DEFENSE_DOWN
    elseif (blinded == dsp.msg.basic.SKILL_ENFEEB_IS) then
        typeEffect = dsp.effect.MAGIC_DEF_DOWN
    else
        skill:setMsg(dsp.msg.basic.SKILL_MISS)
    end

    return typeEffect
end
