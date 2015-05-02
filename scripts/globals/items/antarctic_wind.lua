-----------------------------------------
-- ID: 18164
-- Item: Antarctic Wind
-- Additional Effect: Removes Genbu's Water Damage
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    if (target:getFamily() == 277) then
        target:setMobMod(MOBMOD_ADD_EFFECT, 0);
    end
    return 0, 0, 0;
end;