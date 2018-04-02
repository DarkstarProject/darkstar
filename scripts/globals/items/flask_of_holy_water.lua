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
    local curse = target:getStatusEffect(dsp.effects.CURSE_I);
    local curse2 = target:getStatusEffect(dsp.effects.CURSE_II);
    local bane = target:getStatusEffect(dsp.effects.BANE);
    local power = 33 + target:getMod(MOD_ENHANCES_HOLYWATER);

    if (target:hasStatusEffect(dsp.effects.DOOM) and power > math.random(1, 100)) then
        target:delStatusEffect(dsp.effects.DOOM);
        target:messageBasic(msgBasic.NARROWLY_ESCAPE);
    elseif (curse ~= nil and curse2 ~= nil and bane ~= nil) then
        target:delStatusEffect(dsp.effects.CURSE_I);
        target:delStatusEffect(dsp.effects.CURSE_II);
        target:delStatusEffect(dsp.effects.BANE);
    elseif (curse ~= nil and bane ~= nil) then
        target:delStatusEffect(dsp.effects.CURSE_I);
        target:delStatusEffect(dsp.effects.BANE);
    elseif (curse2 ~= nil and bane ~= nil) then
        target:delStatusEffect(dsp.effects.CURSE_II);
        target:delStatusEffect(dsp.effects.BANE);
    elseif (curse ~= nil) then
        target:delStatusEffect(dsp.effects.CURSE_I);
    elseif (curse2 ~= nil) then
        target:delStatusEffect(dsp.effects.CURSE_II);
    elseif (bane ~= nil) then
        target:delStatusEffect(dsp.effects.BANE);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
