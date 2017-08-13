-----------------------------------------
-- ID: 5306
-- Item: Bottle of Hallowed Water
-- Item Effect: Removes curse. Better chance to remove doom.
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

    -- "Hallowed Water can be used as an item for further synthesis and can also be used to cure ailments like curse,
    -- however the latter effect is no different from Holy Water.
    -- If you happen to have some and you find yourself doomed with no Holy Water, it can serve as a substitute."
    -- https://www.bluegartr.com/threads/112776-Dev-Tracker-Findings-Posts-(NO-DISCUSSION)?p=6519212&viewfull=1#post6519212
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
