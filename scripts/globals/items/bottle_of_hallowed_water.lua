-----------------------------------------
-- ID: 5306
-- Item: Bottle of Hallowed Water
-- Item Effect: Removes curse. Better chance to remove doom.
-----------------------------------------

require("scripts/globals/settings");

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

    local curse = target:getStatusEffect(EFFECT_CURSE_I);
    local curse2 = target:getStatusEffect(EFFECT_CURSE_II);
    local bane = target:getStatusEffect(EFFECT_BANE);
    local final = 0;

    if (curse ~= nil and curse2 ~= nil and bane ~= nil) then
        target:delStatusEffect(EFFECT_CURSE_I);
        target:delStatusEffect(EFFECT_CURSE_II);
        target:delStatusEffect(EFFECT_BANE);
        final = EFFECT_CURSE_II;
    elseif (curse ~= nil and bane ~= nil) then
        target:delStatusEffect(EFFECT_CURSE_I);
        target:delStatusEffect(EFFECT_BANE);
        final = EFFECT_CURSE_I;
    elseif (curse2 ~= nil and bane ~= nil) then
        target:delStatusEffect(EFFECT_CURSE_II);
        target:delStatusEffect(EFFECT_BANE);
        final = EFFECT_CURSE_II;
    elseif (curse ~= nil) then
        target:delStatusEffect(EFFECT_CURSE_I);
        final = EFFECT_CURSE_I;
    elseif (curse2 ~= nil) then
        target:delStatusEffect(EFFECT_CURSE_II);
        final = EFFECT_CURSE_II;
    elseif (bane ~= nil) then
        target:delStatusEffect(EFFECT_BANE);
        final = EFFECT_BANE;
    elseif (target:hasStatusEffect(EFFECT_DOOM) and math.random() <= 0.5) then
        -- remove doom
        target:delStatusEffect(EFFECT_DOOM);
        target:messageBasic(359);
    else
        target:messageBasic(283);
    end

end;