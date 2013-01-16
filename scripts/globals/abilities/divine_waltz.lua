-----------------------------------
-- Ability: Divine Waltz
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

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


	--Applying server mods....
	cure = cure * CURE_POWER;

	player:addHP(cure);
	player:updateEnmityFromCure(target,cure*(240 / ( ( 31 * target:getMainLvl() / 50 ) + 6 )),cure*(40 / ( ( 31 * target:getMainLvl() / 50 ) + 6 )));
	
	return cure;
	
end;