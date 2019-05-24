-----------------------------------------
-- ID: 4148
-- Item: Tincture
-- Item Effect: This potion remedies disease and plague
-----------------------------------------
require("scripts/globals/status")
-----------------------------------------

function onItemCheck(target)
    return 0
end

function onItemUse(target)

    if (target:hasStatusEffect(dsp.effect.PLAGUE) == true) then
        target:delStatusEffect(dsp.effect.PLAGUE)
    end

    if (target:hasStatusEffect(dsp.effect.DISEASE) == true) then
        target:delStatusEffect(dsp.effect.DISEASE)
    end
end

