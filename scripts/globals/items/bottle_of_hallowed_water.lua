-----------------------------------------
-- ID: 5306
-- Item: Bottle of Hallowed Water
-- Item Effect: Removes curse. Better chance to remove doom.
-----------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");

function onItemCheck(target)
    return 0;
end;

function onItemUse(target)
    local curse = target:getStatusEffect(EFFECT.CURSE_I);
    local curse2 = target:getStatusEffect(EFFECT.CURSE_II);
    local bane = target:getStatusEffect(EFFECT.BANE);
    local power = 33 + target:getMod(MOD_ENHANCES_HOLYWATER);

    if (target:hasStatusEffect(EFFECT.DOOM) and power > math.random(1, 100)) then
        target:delStatusEffect(EFFECT.DOOM);
        target:messageBasic(msgBasic.NARROWLY_ESCAPE);
    elseif (curse ~= nil and curse2 ~= nil and bane ~= nil) then
        target:delStatusEffect(EFFECT.CURSE_I);
        target:delStatusEffect(EFFECT.CURSE_II);
        target:delStatusEffect(EFFECT.BANE);
    elseif (curse ~= nil and bane ~= nil) then
        target:delStatusEffect(EFFECT.CURSE_I);
        target:delStatusEffect(EFFECT.BANE);
    elseif (curse2 ~= nil and bane ~= nil) then
        target:delStatusEffect(EFFECT.CURSE_II);
        target:delStatusEffect(EFFECT.BANE);
    elseif (curse ~= nil) then
        target:delStatusEffect(EFFECT.CURSE_I);
    elseif (curse2 ~= nil) then
        target:delStatusEffect(EFFECT.CURSE_II);
    elseif (bane ~= nil) then
        target:delStatusEffect(EFFECT.BANE);
    else
        target:messageBasic(msgBasic.NO_EFFECT);
    end
end;
