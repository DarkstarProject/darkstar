-----------------------------------------
-- ID: 4148
-- Item: Antidote
-- Item Effect: This potion remedies poison.
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

    if (target:hasStatusEffect(EFFECT_POISON) == true) then
        target:delStatusEffect(EFFECT_POISON);
    end
end;

