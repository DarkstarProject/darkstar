---------------------------------------------------
--
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill, summoner)
	local duration = 180 + summoner:getMod(MOD_SUMMONING);
	if duration > 350 then
		duration = 350;
	end;

	-- Garuda's Hastega is a weird exception and uses 153 instead of 15%
   -- That's why it overwrites some things regular haste won't.
   target:addStatusEffect(EFFECT_HASTE,153,0,duration);
	skill:setMsg(MSG_BUFF);
	return EFFECT_HASTE;
end