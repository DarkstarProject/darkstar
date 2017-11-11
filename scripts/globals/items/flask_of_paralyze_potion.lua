-----------------------------------------
-- ID: 4159
-- Item: Paralyze Potion
-- Item Effect: This potion induces paralyze.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    if (not target:hasStatusEffect(EFFECT_PARALYSIS)) then
        target:addStatusEffect(EFFECT_PARALYSIS,20,0,180);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
