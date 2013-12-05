-----------------------------------
-- Ability: Fold
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnAbilityCheck(player,target,ability)
    if (target:hasCorsairEffect()) then
        return 0,0;
    else
        return MSGBASIC_CANNOT_PERFORM,0;
    end
end;

function OnUseAbility(player, target, ability)
	target:fold();

    local merit = target:getMerit(MERIT_FOLD);
    merit = merit - 10;
    
    if (math.random(0, 101) <= merit) then
        target:resetRecast(RECAST_ABILITY,193);
    end
    
    return EFFECT_FOLD;
end;