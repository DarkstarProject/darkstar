---------------------------------------------------
--
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/monstertpmoves");

---------------------------------------------------

function OnAbilityCheck(player, target, ability)
    return 0,0;
end;

function OnPetAbility(target, pet, skill, summoner)
	local duration = 180 + summoner:getMod(MOD_SUMMONING);
	if duration > 350 then
		duration = 350;
	end;

	target:addStatusEffect(EFFECT_HASTE,150,0,duration);
	skill:setMsg(MSG_BUFF);
	return EFFECT_HASTE;
end