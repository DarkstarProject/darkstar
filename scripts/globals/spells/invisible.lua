-----------------------------------------
-- Spell: Invisible
-- Lessens chance of being detected by sight.
-- Duration is random number between 30 seconds and 5 minutes
-----------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    if (not target:hasStatusEffect(dsp.effect.INVISIBLE)) then

        -- last 7-9 minutes
        local duration = math.random(420, 540);

        if (target:getMainLvl() < 25) then
            duration = duration * target:getMainLvl() / 25; -- level adjustment
        end

        if (caster:hasStatusEffect(dsp.effect.COMPOSURE) == true and caster:getID() == target:getID()) then
            duration = duration * 3;
        end

        if (target:getEquipID(15) == 13692) then -- skulker's cape
            duration = duration * 1.5;
        end

        spell:setMsg(dsp.msg.basic.MAGIC_GAIN_EFFECT);
        target:addStatusEffect(dsp.effect.INVISIBLE, 0, 10, math.floor(duration * SNEAK_INVIS_DURATION_MULTIPLIER));
    else
        spell:setMsg(dsp.msg.basic.MAGIC_NO_EFFECT); -- no dsp.effect.
    end

    return dsp.effect.INVISIBLE;
end;
