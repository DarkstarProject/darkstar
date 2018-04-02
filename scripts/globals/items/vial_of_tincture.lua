-----------------------------------------
-- ID: 4148
-- Item: Tincture
-- Item Effect: This potion remedies disease and plague
-----------------------------------------
require("scripts/globals/status");
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)

    if (target:hasStatusEffect(EFFECT.PLAGUE) == true) then
        target:delStatusEffect(EFFECT.PLAGUE);
    end

    if (target:hasStatusEffect(EFFECT.DISEASE) == true) then
        target:delStatusEffect(EFFECT.DISEASE);
    end
end;

