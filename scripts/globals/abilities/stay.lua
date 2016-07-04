-----------------------------------
-- Ability: Stay
-- Commands the Pet to stay in one place.
-- Obtained: Beastmaster Level 15
-- Recast Time: 5 seconds
-- Duration: Instant
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getPet() == nil) then
        return MSGBASIC_REQUIRES_A_PET,0;
    end
    
    return 0,0;
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability,action)
    local pet = player:getPet();
    
    if (not pet:hasPreventActionEffect()) then
      -- reduce tick speed based on level. but never less than 5 and never
      -- more than 10.  This seems to mimic retail.  There is no formula
      -- that I can find, but this seems close.
        local level = 0
        if (player:getMainJob() == JOBS.BST) then
            level = player:getMainLvl()
        elseif (player:getSubJob() == JOBS.BST) then
            level = player:getSubLvl()
        end
        
        local tick = 10 - math.ceil(math.max(0, level / 20))
        --printf('tick: %d', tick)
        pet:addStatusEffectEx(EFFECT_HEALING, 0, 0, tick, 0)
        pet:setAnimation(0)
    end
end;
