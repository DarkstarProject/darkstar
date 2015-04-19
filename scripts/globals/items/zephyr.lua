-----------------------------------------
-- ID: 18163
-- Item: Zephyr
-- Additional Effect: Removes Seiryu's Wind Damage
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    if (target:getFamily() == 278) then
        target:setMobMod(MOBMOD_ADD_EFFECT, 0);
    end
    return 0, 0, 0;
end;