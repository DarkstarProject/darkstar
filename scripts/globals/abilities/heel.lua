-----------------------------------
-- Ability: Heel
-- Commands the pet to cease attacking and return to you.
-- Obtained: Beastmaster Level 10
-- Recast Time: 5 seconds
-- Duration: N/A
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

function onUseAbility(player,target,ability)
    local pet = player:getPet()

    if (pet:hasStatusEffect(EFFECT_HEALING)) then
        pet:delStatusEffect(EFFECT_HEALING)
    end
    
    player:petRetreat();
end;
