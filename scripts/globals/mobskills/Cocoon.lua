---------------------------------------------------
-- Cocoon
-- Enhances defense.
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnMobWeaponSkill(target, mob, skill)
	skill:setMsg(MSG_BUFF);
	local typeEffect = EFFECT_DEFENSE_BOOST;
	mob:delStatusEffect(typeEffect);
	mob:addStatusEffect(typeEffect,50,0,30); -- 50%
	return typeEffect;
end;
