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

function onAbilityCheck(player,target,ability)
    if (player:getWeaponSubSkillType(SLOT_RANGED) == 10 and
        not player:hasStatusEffect(dsp.effects.OVERLOAD) and
        player:getPet()) then
        return 0,0;
    else
        return 71,0;
    end
end;

function onUseAbility(player,target,ability)

    local burden = 15;
    if (target:getStat(MOD_MND) < target:getPet():getStat(MOD_MND)) then
        burden = 20;
    end

    local overload = target:addBurden(ELE_WATER-1, burden);

    if (overload ~= 0) then
        target:removeAllManeuvers();
        target:addStatusEffect(dsp.effects.OVERLOAD, 0, 0, overload);
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

        target:addStatusEffect(dsp.effects.WATER_MANEUVER, bonus, 0, 60);
    end

    return dsp.effects.WATER_MANEUVER;
end;