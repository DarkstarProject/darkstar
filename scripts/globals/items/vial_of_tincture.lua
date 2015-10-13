-----------------------------------------
-- ID: 4148
-- Item: Tincture
-- Item Effect: This potion remedies disease and plague
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

    if (target:hasStatusEffect(EFFECT_PLAGUE) == true) then
        target:delStatusEffect(EFFECT_PLAGUE);
    end

    if (target:hasStatusEffect(EFFECT_DISEASE) == true) then
        target:delStatusEffect(EFFECT_DISEASE);
    end
end;

