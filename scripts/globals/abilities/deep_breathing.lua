-----------------------------------
-- Ability: Deep Breathing
-- Enhances the effect of next breath used by wyvern.
-- Obtained: Dragoon Level 75
-- Recast Time: 5 minutes
-- Duration: 0:03:00 or until the next breath is executed
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getPet() == nil) then
        return MSGBASIC_REQUIRES_A_PET,0;
   elseif (player:getPetID() ~= 48) then
      return MSGBASIC_NO_EFFECT_ON_PET,0;
    else
      return 0,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
   local wyvern = player:getPet();
   wyvern:addStatusEffect(EFFECT_MAGIC_ATK_BOOST,0,0,180); -- Message when effect is lost is "Magic Attack boost wears off."
end;