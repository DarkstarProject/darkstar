-----------------------------------------
-- Spell: Refresh II
-- Gradually restores target party member's MP
-- Composure increases duration 3x
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local mp = 6;
    local duration = 150;

    mp = mp + caster:getMod(dsp.mod.ENHANCES_REFRESH);

    if (caster:hasStatusEffect(dsp.effect.COMPOSURE) and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    if (target:getMainLvl() < 82) then
        duration = duration * target:getMainLvl() / 82;
    end

    if (target:hasStatusEffect(dsp.effect.SUBLIMATION_ACTIVATED) or target:hasStatusEffect(dsp.effect.SUBLIMATION_COMPLETE)) then
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT);
        return 0;
    end

    target:delStatusEffect(dsp.effect.REFRESH);
    target:addStatusEffect(dsp.effect.REFRESH,mp,6,duration);

    return dsp.effect.REFRESH;
end;
