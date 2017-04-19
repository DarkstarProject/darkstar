-----------------------------------------
-- ID: 4154
-- Item: Flask of Holy Water
-- Item Effect: Removes curse
-----------------------------------------
require("scripts/globals/settings");
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
    local curse = target:getStatusEffect(EFFECT_CURSE_I);
    local curse2 = target:getStatusEffect(EFFECT_CURSE_II);
    local bane = target:getStatusEffect(EFFECT_BANE);
    local power = 33 + target:getMod(MOD_ENHANCES_HOLYWATER);

    -- "When the item “Holy Water” is used, regardless of the user’s other status, the removal rate is 33%".
    -- https://www.bluegartr.com/threads/112776-Dev-Tracker-Findings-Posts-(NO-DISCUSSION)?p=6641173&viewfull=1#post6641173
    if (target:hasStatusEffect(EFFECT_DOOM) and power > math.random(1, 100)) then
        target:delStatusEffect(EFFECT_DOOM);
        target:messageBasic(359);
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
        target:messageBasic(283);
    end
end;
