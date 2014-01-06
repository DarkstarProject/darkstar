---------------------------------------------------
-- Aero 2
---------------------------------------------------

require("/scripts/globals/settings");
require("/scripts/globals/status");
require("/scripts/globals/magic");

---------------------------------------------------

function OnAbilityCheck(player, target, ability)
    return 0,0;
end;

function OnPetAbility(target, pet, skill)
    return 0;
end