-----------------------------------
-- Ability: Curing Waltz
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	if (player:getTP() < 20) then
		return MSGBASIC_UNABLE_TO_USE_JA2,0;
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
	target:addHP(cure);
	player:updateEnmityFromCure(target,cure*(240 / ( ( 31 * target:getMainLvl() / 50 ) + 6 )),cure*(40 / ( ( 31 * target:getMainLvl() / 50 ) + 6 )));
	
	return cure;
	
end;