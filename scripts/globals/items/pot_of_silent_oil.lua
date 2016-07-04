-----------------------------------------
--    ID: 4165
--    Silent oil
--    This lubricant cuts down 99.99% of all friction
-----------------------------------------

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
        target:addStatusEffect(EFFECT_SNEAK,1,10,math.random(60, 180));
    end
end;
