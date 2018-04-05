-----------------------------------------
-- Spell: Deodorize
-- Lessens chance of being detected by smell.
-- Duration is random number between 30 seconds and 5 minutes
-----------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    if (not target:hasStatusEffect(dsp.effects.DEODORIZE)) then

        local duration = math.random(420, 540);

        if (target:getMainLvl() < 15) then
            duration = duration * target:getMainLvl() / 15; -- level adjustment
        end

        if (caster:hasStatusEffect(dsp.effects.COMPOSURE) == true and caster:getID() == target:getID()) then
            duration = duration * 3;
        end

        spell:setMsg(msgBasic.MAGIC_GAIN_EFFECT);
        target:addStatusEffect(dsp.effects.DEODORIZE, 0, 10, math.floor(duration * SNEAK_INVIS_DURATION_MULTIPLIER));
    else
        spell:setMsg(msgBasic.MAGIC_NO_EFFECT); -- no dsp.effects.
    end

    return dsp.effects.DEODORIZE;
end;
