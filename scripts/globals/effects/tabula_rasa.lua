-----------------------------------
--
--
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    local regen = effect:getSubPower();
    local helix = effect:getPower();

    if (target:hasStatusEffect(EFFECT_LIGHT_ARTS) or target:hasStatusEffect(EFFECT_ADDENDUM_WHITE)) then
        target:addMod(MOD_BLACK_MAGIC_COST, -30);
        target:addMod(MOD_BLACK_MAGIC_CAST, -30);
        target:addMod(MOD_BLACK_MAGIC_RECAST, -30);
        target:addMod(MOD_REGEN_EFFECT, math.ceil(regen/1.5));
        target:addMod(MOD_REGEN_DURATION, math.ceil((regen*2)/1.5));
        target:addMod(MOD_HELIX_EFFECT, helix);
        target:addMod(MOD_HELIX_DURATION, 108);
    elseif (target:hasStatusEffect(EFFECT_DARK_ARTS) or target:hasStatusEffect(EFFECT_ADDENDUM_BLACK)) then
        target:addMod(MOD_WHITE_MAGIC_COST, -30);
        target:addMod(MOD_WHITE_MAGIC_CAST, -30);
        target:addMod(MOD_WHITE_MAGIC_RECAST, -30);
        target:addMod(MOD_REGEN_EFFECT, regen);
        target:addMod(MOD_REGEN_DURATION, regen*2);
        target:addMod(MOD_HELIX_EFFECT, math.ceil(helix/1.5));
        target:addMod(MOD_HELIX_DURATION, 36);
    else
        target:addMod(MOD_BLACK_MAGIC_COST, -10);
        target:addMod(MOD_BLACK_MAGIC_CAST, -10);
        target:addMod(MOD_BLACK_MAGIC_RECAST, -10);
        target:addMod(MOD_WHITE_MAGIC_COST, -10);
        target:addMod(MOD_WHITE_MAGIC_CAST, -10);
        target:addMod(MOD_WHITE_MAGIC_RECAST, -10);
        target:addMod(MOD_REGEN_EFFECT, regen);
        target:addMod(MOD_REGEN_DURATION, regen*2);
        target:addMod(MOD_HELIX_EFFECT, helix);
        target:addMod(MOD_HELIX_DURATION, 108);
    end
end;

-----------------------------------
-- onEffectTick Action
-----------------------------------

function onEffectTick(target,effect)
end;

-----------------------------------
-- onEffectLose Action
-----------------------------------

function onEffectLose(target,effect)
    local regen = effect:getSubPower();
    local helix = effect:getPower();

    if (target:hasStatusEffect(EFFECT_LIGHT_ARTS) or target:hasStatusEffect(EFFECT_ADDENDUM_WHITE)) then
        target:delMod(MOD_BLACK_MAGIC_COST, -30);
        target:delMod(MOD_BLACK_MAGIC_CAST, -30);
        target:delMod(MOD_BLACK_MAGIC_RECAST, -30);
        target:delMod(MOD_REGEN_EFFECT, math.ceil(regen/1.5));
        target:delMod(MOD_REGEN_DURATION, math.ceil((regen*2)/1.5));
        target:delMod(MOD_HELIX_EFFECT, helix);
        target:delMod(MOD_HELIX_DURATION, 108);
    elseif (target:hasStatusEffect(EFFECT_DARK_ARTS) or target:hasStatusEffect(EFFECT_ADDENDUM_BLACK)) then
        target:delMod(MOD_WHITE_MAGIC_COST, -30);
        target:delMod(MOD_WHITE_MAGIC_CAST, -30);
        target:delMod(MOD_WHITE_MAGIC_RECAST, -30);
        target:delMod(MOD_REGEN_EFFECT, regen);
        target:delMod(MOD_REGEN_DURATION, regen*2);
        target:delMod(MOD_HELIX_EFFECT, math.ceil(helix/1.5));
        target:delMod(MOD_HELIX_DURATION, 36);
    else
        target:delMod(MOD_BLACK_MAGIC_COST, -10);
        target:delMod(MOD_BLACK_MAGIC_CAST, -10);
        target:delMod(MOD_BLACK_MAGIC_RECAST, -10);
        target:delMod(MOD_WHITE_MAGIC_COST, -10);
        target:delMod(MOD_WHITE_MAGIC_CAST, -10);
        target:delMod(MOD_WHITE_MAGIC_RECAST, -10);
        target:delMod(MOD_REGEN_EFFECT, regen);
        target:delMod(MOD_REGEN_DURATION, regen*2);
        target:delMod(MOD_HELIX_EFFECT, helix);
        target:delMod(MOD_HELIX_DURATION, 108);
    end
end;