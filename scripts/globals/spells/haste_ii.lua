-----------------------------------------
-- Spell: Haste II
-- Composure increases duration 3x
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local duration = 180;

    if (caster:hasStatusEffect(dsp.effect.COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    local power = 307; -- 307/1024

    if (target:addStatusEffect(dsp.effect.HASTE,power,0,duration) == false) then
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT);
    end

    return dsp.effect.HASTE;
end;
