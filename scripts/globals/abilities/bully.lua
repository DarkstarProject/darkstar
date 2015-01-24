-----------------------------------
-- Ability: Bully
-- Grants approximately a 15%
-- Intimidation rate solo against
-- Too Weak monsters, and generally
-- doesn't work on NMs.
-- This intimidation rate is
-- treated as an enfeeble on the
-- monster and will apply
-- regardless who the monster is
-- attacking.
-- Intimidation rate scales with
-- party size.
-- Removes the directional
-- requirement from Sneak Attack
-- for main job Thieves when active. 
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)

	local system = target:getSystem();
	local power = 0;
	local duration = 30;
	local levelDifference = (target:getMainLvl() - player:getMainLvl());


	-- Scale to Level Difference ??
	if (levelDifference <= -34) then -- Too Weak
		power = player:getPartySize(1) * 15; -- 15% intimidation rate
	elseif (levelDifference >= -30 and levelDifference <= -25) then -- Incredibly Easy Prey
		power = player:getPartySize(1) * 12; -- 12% intimidation rate
	elseif (levelDifference <= -8 and levelDifference >= -25) then -- Easy Prey
		power = player:getPartySize(1) * 10; -- 10% intimidation rate
	elseif (levelDifference <= -1 and levelDifference >= -7) then -- Descent Challenge
		power = player:getPartySize(1) * 9; -- 9% intimidation rate
	elseif (levelDifference == 0) then -- Even Match
		power = player:getPartySize(1) * 8; -- 8% intimidation rate
	elseif (levelDifference >= 1 and levelDifference >= 3) then -- Tough
		power = player:getPartySize(1) * 7; -- 7% intimidation rate
	elseif (levelDifference <= 4 and levelDifference >= 7) then -- Very Tough
		power = player:getPartySize(1) * 6; -- 6% intimidation rate
	elseif (levelDifference <= 50 and levelDifference >= 8) then -- Incredibly Tough
		power = player:getPartySize(1) * 4; -- 4% intimidation rate
	else
		power = player:getPartySize(1) * 2; -- Default 2% rate catch all
	end

	if (target:isNM()) then
		if (math.random(1,10) == 1) then -- 10% chance to work on NM ??
			power = player:getPartySize(1) * 2; -- 2% intimidation rate per Party member vs NM ??
		end
	end

	if (system == 4 or system == 5 or system == 7 or system == 11 or system == 18 or system == 21) then
		ability:setMsg(156); -- The <player> uses .. No effect on <target>.
		return;
	else
		target:addStatusEffect(EFFECT_BULLY, system, 1, duration, 0, power);
	end

	return EFFECT_BULLY;
end;