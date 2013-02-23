---------------------------------------------------
-- Shell Guard
-- Increases defense of user.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobSkillCheck(target,mob,skill)
	return 0;
end;

function OnMobWeaponSkill(target, mob, skill)
	skill:setMsg(MSG_BUFF);
    local base = 100;
	local typeEffect = EFFECT_DEFENSE_BOOST;
	mob:addStatusEffect(typeEffect,base,0,180);
	return typeEffect;
end
