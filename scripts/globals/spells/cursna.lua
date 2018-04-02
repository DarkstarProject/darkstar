-----------------------------------------
-- Spell: Cursna
-- Removes curse and bane from target.
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local curse = target:getStatusEffect(EFFECT.CURSE_I);
    local curse2 = target:getStatusEffect(EFFECT.CURSE_II);
    local bane = target:getStatusEffect(EFFECT.BANE);
    local bonus = caster:getMod(MOD_ENHANCES_CURSNA) + target:getMod(MOD_ENHANCES_CURSNA_RCVD);
    local power = 25*((100+bonus)/100); -- This 25 is temp until the skill calculation is in.

    spell:setMsg(msgBasic.MAGIC_NO_EFFECT);
    if (target:hasStatusEffect(EFFECT.DOOM) and power > math.random(1, 100)) then
        -- remove doom
        final = EFFECT.DOOM;
        target:delStatusEffect(EFFECT.DOOM);
        spell:setMsg(msgBasic.NARROWLY_ESCAPE);
    elseif (curse ~= nil and curse2 ~= nil and bane ~= nil) then
        target:delStatusEffect(EFFECT.CURSE_I);
        target:delStatusEffect(EFFECT.CURSE_II);
        target:delStatusEffect(EFFECT.BANE);
        final = EFFECT.CURSE_II;
        spell:setMsg(msgBasic.MAGIC_REMOVE_EFFECT);
    elseif (curse ~= nil and bane ~= nil) then
        target:delStatusEffect(EFFECT.CURSE_I);
        target:delStatusEffect(EFFECT.BANE);
        final = EFFECT.CURSE_I;
        spell:setMsg(msgBasic.MAGIC_REMOVE_EFFECT);
    elseif (curse2 ~= nil and bane ~= nil) then
        target:delStatusEffect(EFFECT.CURSE_II);
        target:delStatusEffect(EFFECT.BANE);
        final = EFFECT.CURSE_II;
        spell:setMsg(msgBasic.MAGIC_REMOVE_EFFECT);
    elseif (curse ~= nil) then
        target:delStatusEffect(EFFECT.CURSE_I);
        final = EFFECT.CURSE_I;
        spell:setMsg(msgBasic.MAGIC_REMOVE_EFFECT);
    elseif (curse2 ~= nil) then
        target:delStatusEffect(EFFECT.CURSE_II);
        final = EFFECT.CURSE_II;
        spell:setMsg(msgBasic.MAGIC_REMOVE_EFFECT);
    elseif (bane ~= nil) then
        target:delStatusEffect(EFFECT.BANE);
        final = EFFECT.BANE;
        spell:setMsg(msgBasic.MAGIC_REMOVE_EFFECT);
    end

    return final;
end;
