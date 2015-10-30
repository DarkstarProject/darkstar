-----------------------------------
-- Ability: Retaliation
-- Allows you to counterattack but reduces movement speed.
-- Obtained: Warrior Level 60
-- Recast Time: 3:00
-- Duration: 3:00
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

function onUseAbility(player, target, ability)
    player:addStatusEffect(EFFECT_RETALIATION,1,0,180);
end;