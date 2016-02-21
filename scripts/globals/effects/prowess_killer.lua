-----------------------------------
--
-- EFFECT_PROWESS : "Killer" effects bonus
--
-----------------------------------

-----------------------------------
-- onEffectGain Action
-----------------------------------

function onEffectGain(target,effect)
    target:addMod(MOD_VERMIN_KILLER, effect:getPower());
    target:addMod(MOD_BIRD_KILLER, effect:getPower());
    target:addMod(MOD_AMORPH_KILLER, effect:getPower());
    target:addMod(MOD_LIZARD_KILLER, effect:getPower());
    target:addMod(MOD_AQUAN_KILLER, effect:getPower());
    target:addMod(MOD_PLANTOID_KILLER, effect:getPower());
    target:addMod(MOD_BEAST_KILLER, effect:getPower());
    target:addMod(MOD_UNDEAD_KILLER, effect:getPower());
    target:addMod(MOD_ARCANA_KILLER, effect:getPower());
    target:addMod(MOD_DRAGON_KILLER, effect:getPower());
    target:addMod(MOD_DEMON_KILLER, effect:getPower());
    target:addMod(MOD_EMPTY_KILLER, effect:getPower());
    -- target:addMod(MOD_HUMANOID_KILLER, effect:getPower());
    target:addMod(MOD_LUMORIAN_KILLER, effect:getPower());
    target:addMod(MOD_LUMINION_KILLER, effect:getPower());
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
    target:delMod(MOD_VERMIN_KILLER, effect:getPower());
    target:delMod(MOD_BIRD_KILLER, effect:getPower());
    target:delMod(MOD_AMORPH_KILLER, effect:getPower());
    target:delMod(MOD_LIZARD_KILLER, effect:getPower());
    target:delMod(MOD_AQUAN_KILLER, effect:getPower());
    target:delMod(MOD_PLANTOID_KILLER, effect:getPower());
    target:delMod(MOD_BEAST_KILLER, effect:getPower());
    target:delMod(MOD_UNDEAD_KILLER, effect:getPower());
    target:delMod(MOD_ARCANA_KILLER, effect:getPower());
    target:delMod(MOD_DRAGON_KILLER, effect:getPower());
    target:delMod(MOD_DEMON_KILLER, effect:getPower());
    target:delMod(MOD_EMPTY_KILLER, effect:getPower());
    -- target:delMod(MOD_HUMANOID_KILLER, effect:getPower());
    target:delMod(MOD_LUMORIAN_KILLER, effect:getPower());
    target:delMod(MOD_LUMINION_KILLER, effect:getPower());
end;