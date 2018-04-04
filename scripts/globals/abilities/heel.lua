-----------------------------------
-- Ability: Heel
-- Commands the pet to cease attacking and return to you.
-- Obtained: Beastmaster Level 10
-- Recast Time: 5 seconds
-- Duration: N/A
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getPet() == nil) then
      return msgBasic.REQUIRES_A_PET,0;
    end

    return 0,0;
end;

function onUseAbility(player,target,ability)
    local pet = player:getPet()

    if (pet:hasStatusEffect(dsp.effects.HEALING)) then
        pet:delStatusEffect(dsp.effects.HEALING)
    end

    player:petRetreat();
end;
