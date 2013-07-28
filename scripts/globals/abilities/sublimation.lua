-----------------------------------
-- Ability: Sublimation
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
	
	local sublimationComplete = player:getStatusEffect(EFFECT_SUBLIMATION_COMPLETE);
	local sublimationCharging = player:getStatusEffect(EFFECT_SUBLIMATION_ACTIVATED);
	local mp = 0;

	if sublimationComplete ~= nil then
		mp = sublimationComplete:getPower();
		local maxmp = player:getMaxMP();
		local currmp = player:getMP();
		if( mp + currmp > maxmp ) then
			mp = maxmp - currmp;
		end
		player:addMP(mp);
		player:delStatusEffectSilent(EFFECT_SUBLIMATION_COMPLETE);
		ability:setMsg(451);
	elseif sublimationCharging ~= nil then
		mp = sublimationCharging:getPower();
		local maxmp = player:getMaxMP();
		local currmp = player:getMP();
		if( mp + currmp > maxmp ) then
			mp = maxmp - currmp;
		end
		player:addMP(mp);
		player:delStatusEffectSilent(EFFECT_SUBLIMATION_ACTIVATED);
		ability:setMsg(451);
	else
		local refresh = player:getStatusEffect(EFFECT_REFRESH);
		if refresh == nil or refresh:getSubPower() < 3 then
			player:delStatusEffect(EFFECT_REFRESH);
			player:addStatusEffect(EFFECT_SUBLIMATION_ACTIVATED,0,3,7200);
		else
			ability:setMsg(323);
		end
	end
    return mp;
end;