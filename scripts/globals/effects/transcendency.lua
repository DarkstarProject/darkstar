-----------------------------------
require("scripts/globals/status");
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_HP, 9000);
    target:addMod(MOD_MP, 9000);
    target:addMod(MOD_REGEN, 300);
    target:addMod(MOD_REFRESH, 300);
    target:addMod(MOD_REGAIN, 500);
    target:addMod(MOD_STR, 900);
    target:addMod(MOD_DEX, 900);
    target:addMod(MOD_VIT, 900);
    target:addMod(MOD_AGI, 900);
    target:addMod(MOD_INT, 900);
    target:addMod(MOD_MND, 900);
    target:addMod(MOD_CHR, 900);
    target:addMod(MOD_ATT, 9000);
    target:addMod(MOD_DEF, 9000);
    target:addMod(MOD_ACC, 1000);
    target:addMod(MOD_EVA, 1000);
    target:addMod(MOD_MATT, 900);
    target:addMod(MOD_RACC, 1000);
    target:addMod(MOD_RATT, 9000);
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
    target:delMod(MOD_HP, 9000);
    target:delMod(MOD_MP, 9000);
    target:delMod(MOD_REGEN, 300);
    target:delMod(MOD_REFRESH, 300);
    target:delMod(MOD_REGAIN, 500);
    target:delMod(MOD_STR, 900);
    target:delMod(MOD_DEX, 900);
    target:delMod(MOD_VIT, 900);
    target:delMod(MOD_AGI, 900);
    target:delMod(MOD_INT, 900);
    target:delMod(MOD_MND, 900);
    target:delMod(MOD_CHR, 900);
    target:delMod(MOD_ATT, 9000);
    target:delMod(MOD_DEF, 9000);
    target:delMod(MOD_ACC, 1000);
    target:delMod(MOD_EVA, 1000);
    target:delMod(MOD_MATT, 900);
    target:delMod(MOD_RACC, 1000);
    target:delMod(MOD_RATT, 9000);
end;
