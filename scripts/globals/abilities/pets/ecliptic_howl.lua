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
	local moon = VanadielMoonPhase();
	local buffvalue = 0;
	if moon > 90 then
		buffvalue = 25;
	elseif moon > 75 then
		buffvalue = 21;
	elseif moon > 60 then
		buffvalue = 17;
	elseif moon > 40 then
		buffvalue = 13;
	elseif moon > 25 then
		buffvalue = 9;
	elseif moon > 10 then
		buffvalue = 5;
	else
		buffvalue = 1;
	end
	target:delStatusEffect(EFFECT_ACCURACY_BOOST);
	target:delStatusEffect(EFFECT_EVASION_BOOST);
	target:addStatusEffect(EFFECT_ACCURACY_BOOST,buffvalue,0,180);
	target:addStatusEffect(EFFECT_EVASION_BOOST,25-buffvalue,0,180);
	skill:setMsg(0);
	return 0;
end