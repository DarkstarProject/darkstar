-----------------------------------------
-- ID: 10383
-- Item: Dream Mittens +1
-- Enchantment: Invisible
-- Duration: 3 Mins 20 Secs
-- TODO: Enhances duration of Invisible Effect
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
    if (not target:hasStatusEffect(EFFECT_INVISIBLE)) then
        target:addStatusEffect(EFFECT_INVISIBLE,0,10,200);
    end
end;
