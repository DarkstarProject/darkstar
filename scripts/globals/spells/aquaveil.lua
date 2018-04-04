-----------------------------------------
-- Spell: Aquaveil
-- Reduces chance of having a spell interrupted.
-----------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    target:delStatusEffect(dsp.effects.AQUAVEIL);

    -- duration is said to be based on enhancing skill with max 5 minutes, but I could find no
    -- tests that quantify the relationship so I'm using 5 minutes for now.

    local duration = 300;
    local power = AQUAVEIL_COUNTER + caster:getMod(MOD_AQUAVEIL_COUNT);
    if (caster:getSkillLevel(ENHANCING_MAGIC_SKILL) >= 200) then -- cutoff point is estimated. https://www.bg-wiki.com/bg/Aquaveil
        power = power + 1;
    end
    if (power < 1) then -- this shouldn't happen but it's probably best to prevent someone from accidentally underflowing the counter...
        power = 1;
    end;

    if (caster:hasStatusEffect(dsp.effects.COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    target:addStatusEffect(dsp.effects.AQUAVEIL,power,0,duration);
    spell:setMsg(msgBasic.MAGIC_GAIN_EFFECT);

    return dsp.effects.AQUAVEIL;
end;
