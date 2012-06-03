---------------------------------------------------
-- Hastega
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnPetAbility(target, pet, skill)
	target:delStatusEffect(EFFECT_HASTE);
	target:addStatusEffect(EFFECT_HASTE,15,0,90);
	skill:setMsg(MSG_BUFF);
	return EFFECT_HASTE;
end