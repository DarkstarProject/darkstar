-----------------------------------------
-- ID: 4154
-- Item: Flask of Holy Water
-- Item Effect: Removes curse
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    local curse = target:getStatusEffect(EFFECT_CURSE_I);
    local curse2 = target:getStatusEffect(EFFECT_CURSE_II);
    local bane = target:getStatusEffect(EFFECT_BANE);
    local power = 33 + target:getMod(MOD_ENHANCES_HOLYWATER);

    if (target:hasStatusEffect(EFFECT_DOOM) and power > math.random(1, 100)) then
        target:delStatusEffect(EFFECT_DOOM);
        target:messageBasic(msgBasic.NARROWLY_ESCAPE);
    elseif (curse ~= nil and curse2 ~= nil and bane ~= nil) then
        target:delStatusEffect(EFFECT_CURSE_I);
        target:delStatusEffect(EFFECT_CURSE_II);
        target:delStatusEffect(EFFECT_BANE);
    elseif (curse ~= nil and bane ~= nil) then
        target:delStatusEffect(EFFECT_CURSE_I);
        target:delStatusEffect(EFFECT_BANE);
    elseif (curse2 ~= nil and bane ~= nil) then
        target:delStatusEffect(EFFECT_CURSE_II);
        target:delStatusEffect(EFFECT_BANE);
    elseif (curse ~= nil) then
        target:delStatusEffect(EFFECT_CURSE_I);
    elseif (curse2 ~= nil) then
        target:delStatusEffect(EFFECT_CURSE_II);
    elseif (bane ~= nil) then
        target:delStatusEffect(EFFECT_BANE);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
