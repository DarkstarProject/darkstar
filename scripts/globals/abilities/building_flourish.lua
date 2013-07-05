-----------------------------------
-- Ability: Building Flourish
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)

	if (player:hasStatusEffect(EFFECT_FINISHING_MOVE_1)) then
		return 0,0;

	elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_2)) then
		return 0,0;

	elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_3)) then
		return 0,0;

	elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_4)) then
		return 0,0;

	elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_5)) then
		return 0,0;
	
	else	
		return MSGBASIC_NO_FINISHINGMOVES,0;
	end;
end;

function OnUseAbility(player, target, ability)

	if (player:hasStatusEffect(EFFECT_FINISHING_MOVE_1)) then
		player:delStatusEffect(EFFECT_FINISHING_MOVE_1);
		player:addStatusEffect(EFFECT_BUILDING_FLOURISH,1,0,60, 0, player:getMerit(MERIT_BUILDING_FLOURISH_EFFECT));
	elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_2)) then
		player:delStatusEffect(EFFECT_FINISHING_MOVE_2);
		player:addStatusEffect(EFFECT_BUILDING_FLOURISH,2,0,60, 0, player:getMerit(MERIT_BUILDING_FLOURISH_EFFECT));
	elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_3)) then
		player:delStatusEffect(EFFECT_FINISHING_MOVE_3);
		player:addStatusEffect(EFFECT_BUILDING_FLOURISH,3,0,60, 0, player:getMerit(MERIT_BUILDING_FLOURISH_EFFECT));
	elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_4)) then
		player:delStatusEffect(EFFECT_FINISHING_MOVE_4);
		player:addStatusEffect(EFFECT_FINISHING_MOVE_1,1,0,7200);
		player:addStatusEffect(EFFECT_BUILDING_FLOURISH,3,0,60, 0, player:getMerit(MERIT_BUILDING_FLOURISH_EFFECT));
	elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_5)) then
		player:delStatusEffect(EFFECT_FINISHING_MOVE_5);
		player:addStatusEffect(EFFECT_FINISHING_MOVE_2,1,0,7200);
		player:addStatusEffect(EFFECT_BUILDING_FLOURISH,3,0,60, 0, player:getMerit(MERIT_BUILDING_FLOURISH_EFFECT));
	end;

end;