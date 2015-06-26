---------------------------------------------------
-- Crimson Howl
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill, summoner)
	local duration = 30 + summoner:getMod(MOD_SUMMONING);
	target:addStatusEffect(EFFECT_WARCRY,9,0,duration);
	skill:setMsg(MSG_BUFF);
	return EFFECT_WARCRY;
end