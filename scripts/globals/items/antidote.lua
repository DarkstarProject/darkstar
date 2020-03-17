-----------------------------------------
-- ID: 4148
-- Item: Antidote
-- Item Effect: This potion remedies poison.
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)

    if (target:hasStatusEffect(tpz.effect.POISON) == true) then
        target:delStatusEffect(tpz.effect.POISON)
    end
end

