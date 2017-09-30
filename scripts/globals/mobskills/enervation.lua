---------------------------------------------
--  Enervation
--
--  Description: Lowers the defense and magical defense of enemies within range.
--  Type: Magical (Dark)
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
  if(mob:getFamily() == 91) then
    local mobSkin = mob:getModelId();

    if (mobSkin == 1680) then
        return 0;
    else
        return 1;
    end
  end
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_DEFENSE_DOWN;

    local silenced = false;
    local blinded = false;

    silenced = MobStatusEffectMove(mob, target, EFFECT_DEFENSE_DOWN, 10, 0, 120);

    blinded = MobStatusEffectMove(mob, target, EFFECT_MAGIC_DEF_DOWN, 8, 0, 120);

    skill:setMsg(msgBasic.ENFEEB_IS);

    -- display silenced first, else blind
    if (silenced == msgBasic.ENFEEB_IS) then
        typeEffect = EFFECT_DEFENSE_DOWN;
    elseif (blinded == msgBasic.ENFEEB_IS) then
        typeEffect = EFFECT_MAGIC_DEF_DOWN;
    else
        skill:setMsg(msgBasic.MISS);
    end

    return typeEffect;
end;
