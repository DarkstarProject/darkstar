-----------------------------------
-- Ability: Water Maneuver
-- Enhances the effect of water attachments. Must have animator equipped.
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

    local burden = 15;
    if (target:getStat(MOD_MND) < target:getPet():getStat(MOD_MND)) then
        burden = 20;
    end

    local overload = target:addBurden(ELE_WATER-1, burden);

    if (overload ~= 0) then
        target:removeAllManeuvers();
        target:addStatusEffect(EFFECT_OVERLOAD, 0, 0, overload);
    else
        local level;
        if (target:getMainJob() == JOBS.PUP) then
            level = target:getMainLvl()
        else
            level = target:getSubLvl()
        end

        local bonus = 1 + (level/15) + target:getMod(MOD_MANEUVER_BONUS);

        if (target:getActiveManeuvers() == 3) then
            target:removeOldestManeuver();
        end

        target:addStatusEffect(EFFECT_WATER_MANEUVER, bonus, 0, 60);
    end

    return EFFECT_WATER_MANEUVER;
end;