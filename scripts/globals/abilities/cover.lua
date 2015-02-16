-----------------------------------
--	Author:
-- 	Cover
-- 	Allows player to protect the target by placing themselves between them and the enemy.
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

function onAbilityCheck(player,target,ability)
	return 0,0;
end;

function OnUseAbility(player, target, ability)
	--print();
	ability:setMsg(0);
	duration = 60 + player:getMerit(MERIT_COVER_EFFECT_LENGTH);
	if (target ~= player) then
		target:addStatusEffect(EFFECT_COVER,1,0,duration);
		cover = target:getStatusEffect(EFFECT_COVER);
		cover:setEffector(player);
	end
end;