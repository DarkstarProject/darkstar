-----------------------------------
-- Ability: Overdrive
-- Augments the fighting ability of your automaton to its maximum level.
-- Obtained: Puppetmaster Level 1
-- Recast Time: 1:00:00
-- Duration: 1:00
-----------------------------------
require("scripts/globals/settings")
require("scripts/globals/status")
require("scripts/globals/pets")
require("scripts/globals/msg");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if not player:getPet() then
        return msgBasic.REQUIRES_A_PET, 0
    elseif not player:getPetID() or not (player:getPetID() >= 69 and player:getPetID() <= 72) then
        return msgBasic.NO_EFFECT_ON_PET, 0
    else
        return 0, 0
    end
end

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    player:addStatusEffect(EFFECT_OVERDRIVE, 0, 0, 60)
    return EFFECT_OVERDRIVE
end
