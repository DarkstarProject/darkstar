---------------------------------------------------
-- Berserk
-- Berserk Ability.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	skill:setMsg(MSG_BUFF);
	local typeEffect = EFFECT_BERSERK;
	mob:delStatusEffect(typeEffect);
	mob:addStatusEffect(typeEffect,1,0,180);
	return typeEffect;
end;
