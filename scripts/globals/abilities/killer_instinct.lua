-----------------------------------
--
-- TODO: This ability isn't in the sql table yet!
--
-- Ability: Killer Instinct
-- Grants your pet's Killer effect to party members within area of effect. 
-- Obtained: Beastmaster Level 75 (2nd Tier Merit)
-- Recast Time: 5:00
-- Duration: 3:00
--
-- Pet Ecosystem   | grants this Killer Effect    | ID (effect power) to tell onEffectGain/Lose which MOD to raise/delete
-- -------------   --------------------------     ------------------------------------------
-- BEAST           | LIZARD KILLER                | 1
-- LIZARD          | VERMIN KILLER                | 2
-- VERMIN          | PLANTOID KILLER              | 3
-- PLANTOID        | BEAST KILLER                 | 4

-- AQUAN           | AMORPH KILLER                | 5
-- AMORPH          | BIRD KILLER                  | 6
-- BIRD            | AQUAN KILLER                 | 7

-- NONE            | NONE                         | 9
----------------------------------------------------------------------------------------------------

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
    local pet = player:getPet()
    -- local sHead = player:getEquipID(SLOT_HEAD)
    local duration = 180                           -- TODO: duration increase by merits (10s per) and equipment
    
    if (pet:getSystem() == SYSTEM_BEAST) then player:addStatusEffect(EFFECT_KILLER_INSTINCT,1,0,duration)
    elseif (pet:getSystem() == SYSTEM_LIZARD) then player:addStatusEffect(EFFECT_KILLER_INSTINCT,2,0,duration)
    elseif (pet:getSystem() == SYSTEM_VERMIN) then player:addStatusEffect(EFFECT_KILLER_INSTINCT,3,0,duration)
    elseif (pet:getSystem() == SYSTEM_PLANTOID) then player:addStatusEffect(EFFECT_KILLER_INSTINCT,4,0,duration)
    elseif (pet:getSystem() == SYSTEM_AQUAN) then player:addStatusEffect(EFFECT_KILLER_INSTINCT,5,0,duration)
    elseif (pet:getSystem() == SYSTEM_AMORPH) then player:addStatusEffect(EFFECT_KILLER_INSTINCT,6,0,duration)
    elseif (pet:getSystem() == SYSTEM_BIRD) then player:addStatusEffect(EFFECT_KILLER_INSTINCT,7,0,duration)
    else player:addStatusEffect(EFFECT_KILLER_INSTINCT,9,0,duration)
    end
end;