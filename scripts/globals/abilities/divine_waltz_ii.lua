-----------------------------------
-- Ability: Divine Waltz
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
	if (player:getTP() < 80) then
		return MSGBASIC_UNABLE_TO_USE_JA2,0;
	else
		player:delTP(80);
		return 0,0;
	end
end;

function OnUseAbility(player, target, ability)

	--Grabbing variables.
	local vit = target:getStat(MOD_VIT);
	local chr = player:getStat(MOD_CHR);
	local cure = 0;
	
	cure = (vit+chr)*0.39+295;

	cure = cure + (cure * (player:getMod(MOD_WALTZ_POTENCY)/100));
	cure = cure + (cure * (target:getMod(MOD_WALTZ_RCVD)/100));

	--Applying server mods....
	cure = cure * CURE_POWER;

	player:addHP(cure);
	player:updateEnmityFromCure(target,cure*(240 / ( ( 31 * target:getMainLvl() / 50 ) + 6 )),cure*(40 / ( ( 31 * target:getMainLvl() / 50 ) + 6 )));
	
	return cure;
	
end;