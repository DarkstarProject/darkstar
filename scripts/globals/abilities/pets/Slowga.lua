---------------------------------------------------
-- 
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnPetAbility(target, pet, skill)
	duration = 180 + summoner:getMod(MOD_SUMMONING);
	if duration > 350 then
		duration = 350;
	end;
	target:delStatusEffect(EFFECT_SLOW);
	target:delStatusEffect(EFFECT_HASTE);
	target:addStatusEffect(EFFECT_SLOW,30,0,duration);
	skill:setMsg(MSG_BUFF);
	return EFFECT_HASTE;
end