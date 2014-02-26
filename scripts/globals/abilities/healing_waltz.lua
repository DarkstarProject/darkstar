-----------------------------------
-- Ability: Healing Waltz
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	if (player:hasStatusEffect(EFFECT_TRANCE)) then
		return 0,0;
	elseif (player:getTP() < 20) then
		return MSGBASIC_NOT_ENOUGH_TP,0;
	else
		player:delTP(20);
		return 0,0;
	end;
end;

function OnUseAbility(player, target, ability)

	local effect = target:healingWaltz();

    if(effect == EFFECT_NONE) then
        ability:setMsg(283); -- no effect
    else
        ability:setMsg(123);
    end

    return effect;
end;
