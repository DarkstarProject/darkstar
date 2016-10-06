-----------------------------------
-- Ability: Holy Circle
-- Grants resistance, defense, and attack against Undead to party members within the area of effect.
-- Obtained: Paladin Level 5
-- Recast Time: 5:00 minutes
-- Duration: 3:00 minutes
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    local power = 5;			--when cast as Subjob
    local duration = 180;

    if (player:getMainJob() == JOBS.PLD) then
        local sFeet = player:getEquipID(SLOT_FEET);

        if (sFeet == 14095 or sFeet == 15358 or sFeet == 28229 or sFeet == 28250) then
            power = 17;			--when cast as Mainjob w/ equipment
            duration = 240;		--Leggings increase duration by 50%
        else
            power = 15;			--when cast as Mainjob w/o equipment
        end
    end
    
    target:addStatusEffect(EFFECT_HOLY_CIRCLE,power,0,duration);
end;