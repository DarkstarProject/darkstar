-----------------------------------
-- Ability: Curing Waltz
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
    if (target:getHP() == 0) then
		return MSGBASIC_CANNOT_ON_THAT_TARG,0;
    elseif (player:hasStatusEffect(EFFECT_TRANCE)) then
		return 0,0;
	elseif (player:getTP() < 20) then
		return MSGBASIC_NOT_ENOUGH_TP,0;
	else
		player:delTP(20);
		return 0,0;
	end
end;

function OnUseAbility(player, target, ability)
	
	--Grabbing variables.
	local vit = target:getStat(MOD_VIT);
	local chr = player:getStat(MOD_CHR);
	local mjob = player:getMainJob(); --19 for DNC main.
	local sjob = player:getSubJob();
	local cure = 0;


	
	--Performing sj mj check.
	if(mjob == 19) then
		cure = (vit+chr)*0.25+60;
	end
	
	if(sjob == 19) then
		cure = (vit+chr)*0.125+60;
	end

	--Reducing TP.

	--Applying server mods....
	cure = cure * CURE_POWER;

	--Cap the final amount to max HP.
	if((target:getMaxHP() - target:getHP()) < cure) then
		cure = (target:getMaxHP() - target:getHP());
	end
	
	--Do it
	target:restoreHP(cure);
	player:updateEnmityFromCure(target,cure);
	
	return cure;
	
end;