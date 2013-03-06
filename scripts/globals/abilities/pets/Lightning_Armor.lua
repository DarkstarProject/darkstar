---------------------------------------------------
-- 
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnPetAbility(target, pet, skill, summoner)
	local duration = 90 + 3 * summoner:getMod(MOD_SUMMONING);
	target:delStatusEffect(EFFECT_SHOCK_SPIKES);
	target:addStatusEffect(EFFECT_SHOCK_SPIKES,15,0,duration);
	skill:setMsg(MSG_BUFF);
	return EFFECT_SHOCK_SPIKES;
end