---------------------------------------------------
-- Aerial Armor
---------------------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)
	target:delStatusEffect(EFFECT_STONESKIN);
	local amount = pet:getMainLvl()*2 + 50;
	target:addStatusEffect(EFFECT_STONESKIN,amount,0,900);
	skill:setMsg(MSG_BUFF);
	return EFFECT_STONESKIN;
end