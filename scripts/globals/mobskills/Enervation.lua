---------------------------------------------
--  Enervation
--
--  Description: Lowers the defense and magical defense of enemies within range.
--  Type: Magical (Dark)
---------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

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

    skill:setMsg(MSG_ENFEEB_IS);

    -- display silenced first, else blind
    if (silenced == MSG_ENFEEB_IS) then
        typeEffect = EFFECT_DEFENSE_DOWN;
    elseif (blinded == MSG_ENFEEB_IS) then
        typeEffect = EFFECT_MAGIC_DEF_DOWN;
    else
        skill:setMsg(MSG_MISS);
    end

	return typeEffect;
end;
