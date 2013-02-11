-----------------------------------
-- Ability: Mijin Gakure
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- OnUseAbility
-----------------------------------

function OnUseAbility(player, target, ability)

    local dmg = (player:getHP() * 0.8) + (player:getMainLvl() / 0.5);

    player:setHP(0);
    target:delHP(dmg);

    return dmg;
end;
