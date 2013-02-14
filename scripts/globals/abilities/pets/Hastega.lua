---------------------------------------------------
-- 
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnPetAbility(target, pet, skill, summoner)
	duration = 180 + summoner:getMod(MOD_SUMMONING);
	if duration > 350 then
		duration = 350;
	end;
	target:delStatusEffect(EFFECT_HASTE);
	target:delStatusEffect(EFFECT_SLOW);
	target:addStatusEffect(EFFECT_HASTE,150,0,duration);
	skill:setMsg(MSG_BUFF);
	return EFFECT_HASTE;
end