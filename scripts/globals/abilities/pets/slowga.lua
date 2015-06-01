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

	if(target:addStatusEffect(EFFECT_SLOW,300,0,duration)) then
        skill:setMsg(MSG_ENFEEB_IS);
    else
    	skill:setMsg(MSG_NO_EFFECT);
    end
	return EFFECT_SLOW;
end