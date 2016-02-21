-----------------------------------
-- Ability: Mijin Gakure
-- Sacrifices user's life to deal damage to an enemy.
-- Obtained: Ninja Level 1
-- Recast Time: 1:00:00
-- Duration: Instant
-----------------------------------

require("scripts/globals/monstertpmoves");
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

    local dmg = (player:getHP() * 0.8) + (player:getMainLvl() / 0.5);
    local resist = applyPlayerResistance(player, nil, target, player:getStat(MOD_INT)-target:getStat(MOD_INT), 0, ELE_NONE);

    dmg = dmg * resist;

    target:delHP(dmg);

    player:setLocalVar("MijinGakure", 1)
    player:setHP(0)
    return dmg;
end;
