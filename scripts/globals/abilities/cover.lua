-----------------------------------
-- Ability: Cover
-- Allows player to protect the
-- target by placing themselves
-- between them and the enemy.
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------

function OnAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	ability:setMsg(311);
	local duration = 15;
	-- local merit = player:getMerit(MERIT_COVER_EFFECT_LENGTH);
	-- duration = duration + merit;
	if (target ~= player) then
		target:addStatusEffect(EFFECT_COVER,1,0,duration);
		player:setCoverProvider(1);
	else
		ability:setMsg(312);
	end
end;