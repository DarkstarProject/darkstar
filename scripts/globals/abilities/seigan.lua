-----------------------------------
-- Ability: Seigan
-- Grants a bonus to Third Eye when using two-handed weapons.
-- Obtained: Samurai Level 35
-- Recast Time: 1:00
-- Duration: 5:00
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (not target:isWeaponTwoHanded()) then
        return MSGBASIC_NEEDS_2H_WEAPON,0;
    else
        return 0,0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    if (target:isWeaponTwoHanded()) then
        target:delStatusEffect(EFFECT_HASSO);
        target:delStatusEffect(EFFECT_SEIGAN);
        target:addStatusEffect(EFFECT_SEIGAN,0,0,300);
    end
end;