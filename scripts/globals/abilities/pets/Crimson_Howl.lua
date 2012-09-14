---------------------------------------------------
-- Aerial Armor
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnPetAbility(target, pet, skill)
	duration = 30 + player:getMod(MOD_SUMMONING);
	target:addStatusEffect(EFFECT_ATTACK_BOOST,9,0,duration);
	skill:setMsg(MSG_BUFF);
	return EFFECT_ATTACK_BOOST;
end