-----------------------------------
-- Ability: Mantra
-----------------------------------
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	--[[
	it is necessary to explicitlyremove this effect before
	starting so that HP calculations cannot use an existing
	MAX_HP_BOOST effect to boost itself, since other sources
	of MOD_HP are allowed (but not MOD_HPP).
	]]--
	player:delStatusEffect(EFFECT_MAX_HP_BOOST);

	local merits = player:getMerit(MERIT_MANTRA);
	local maxhp = target:getMaxHP();
	local hpp = target:getMod(MOD_HPP);
	local hpmod = target:getMod(MOD_HP);
	local hppdel = maxhp*(hpp / 100);
	local mult = 0.04 * merits;


	local power = math.floor((maxhp-hppdel)*mult);
	target:addStatusEffect(EFFECT_MAX_HP_BOOST,power,0,180);
end;
