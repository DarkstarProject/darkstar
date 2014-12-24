-----------------------------------
-- Ability: Water Maneuver
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onUseAbility
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getWeaponSubSkillType(SLOT_RANGED) == 10) then
        return 0,0;
    else
        return 71,0;
    end
end;

function onUseAbility(player, target, ability)
	if (target:getActiveManeuvers() == 3) then
        target:removeOldestManeuver();
    end
    
    target:addStatusEffect(EFFECT_WATER_MANEUVER, 0, 0, 60);
    
    return EFFECT_WATER_MANEUVER;
end;