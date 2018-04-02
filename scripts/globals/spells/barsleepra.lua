-----------------------------------------
-- Spell: Barsleepra
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local meritBonus = caster:getMerit(MERIT_BAR_SPELL_EFFECT);    
    --printf("Barspell: Merit Bonus +%d", meritBonus);
    
    local enhanceSkill = caster:getSkillLevel(34);

    local power = 1 + 0.02 * enhanceSkill + meritBonus;

    local duration = 150;

    if (enhanceSkill > 180) then
        duration = 150 + 0.8 * (enhanceSkill - 180);
    end

    if (caster:hasStatusEffect(dsp.effects.COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    target:addStatusEffect(dsp.effects.BARSLEEP,power,0,duration);

    return dsp.effects.BARSLEEP;
end;
