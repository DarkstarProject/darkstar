-----------------------------------------
-- ID: 15753
-- Item: Dream Boots +1
-- Enchantment: Sneak
-- Duration: 3 Mins 20 Secs
-- TODO: Enhances duration of Sneak Effect
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------------
-- OnItemCheck
-----------------------------------------
function onItemCheck(target)
    return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    if (not target:hasStatusEffect(EFFECT_SNEAK)) then
        target:addStatusEffect(EFFECT_SNEAK,1,10,200);
    end
end;
