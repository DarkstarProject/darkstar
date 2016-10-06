-----------------------------------
-- Ability: Arcane Circle
-- Grants resistance, defense, and attack against Arcana to party members within the area of effect.
-- Obtained: Dark Knight Level 5
-- Recast Time: 5:00 minutes
-- Duration: 3:00 minutes
-----------------------------------

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

    if (player:getMainJob() == JOBS.DRK) then
        local sFeet = player:getEquipID(SLOT_FEET);

        if (sFeet == 14096 or sFeet == 15359 or sFeet == 28230 or sFeet == 28251) then
            power = 17;			--when cast as Mainjob w/ equipment
            duration = 240;		--Sollerets increase duration by 50%
        else
            power = 15;			--when cast as Mainjob w/o equipment
        end
    end
    
    target:addStatusEffect(EFFECT_ARCANE_CIRCLE,power,0,duration);
end;