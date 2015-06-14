-----------------------------------
-- Ability: Dark Maneuver
-- Enhances the effect of dark attachments. Must have animator equipped.
-- Obtained: Puppetmaster level 1
-- Recast Time: 10 seconds (shared with all maneuvers)
-- Duration: 1 minute
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getWeaponSubSkillType(SLOT_RANGED) == 10 and
        not player:hasStatusEffect(EFFECT_OVERLOAD)) then
        return 0,0;
    else
        return 71,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)

    local burden = 10;
    if (target:getMP() < target:getPet():getMP()) then
        burden = 15;
    end

    local overload = target:addBurden(ELE_DARK-1, burden);

    if (overload ~= 0) then
        target:removeAllManeuvers();
        target:addStatusEffect(EFFECT_OVERLOAD, 0, 0, overload);
    else
        if (target:getActiveManeuvers() == 3) then
            target:removeOldestManeuver();
        end

        target:addStatusEffect(EFFECT_DARK_MANEUVER, 0, 0, 60);
    end

    return EFFECT_DARK_MANEUVER;
end;