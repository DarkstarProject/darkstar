-----------------------------------
-- Ability: Call Wyvern
-- Summons a Wyvern to fight by your side.
-- Obtained: Dragoon Level 1
-- Recast Time: 20:00
-- Duration: Instant
-- Special: Only available if Dragoon is your main class.
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/pets");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getPet() ~= nil) then
         return MSGBASIC_ALREADY_HAS_A_PET,0;
    elseif (player:hasStatusEffect(EFFECT_SPIRIT_SURGE) == true) then
        return MSGBASIC_UNABLE_TO_USE_JA,0;
    elseif (not player:canUsePet()) then
        return MSGBASIC_CANT_BE_USED_IN_AREA,0;
    else
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    player:spawnPet(PET_WYVERN);
end;
