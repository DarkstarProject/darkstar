-----------------------------------
-- Ability: Healing Waltz
-----------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
	if (target:getHP() == 0) then
		return MSGBASIC_CANNOT_ON_THAT_TARG,0;
    elseif(player:hasStatusEffect(EFFECT_SABER_DANCE)) then
        return MSGBASIC_UNABLE_TO_USE_JA2, 0;
    elseif (player:hasStatusEffect(EFFECT_TRANCE)) then
		return 0,0;
	elseif (player:getTP() < 20) then
		return MSGBASIC_NOT_ENOUGH_TP,0;
	else
		player:delTP(20);
        -- apply waltz recast modifiers
        if(player:getMod(MOD_WALTZ_RECAST)~=0) then
            local recastMod = -150 * (player:getMod(MOD_WALTZ_RECAST)); -- 750 ms or 5% per merit
            if(recastMod <0) then
                --TODO
            end
        end
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
