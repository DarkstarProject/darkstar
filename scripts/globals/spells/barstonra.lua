-----------------------------------------
-- Spell: BARSTONRA
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    local enhanceSkill = caster:getSkillLevel(dsp.skill.ENHANCING_MAGIC);
    local power = calculateBarspellPower(caster,enhanceSkill);
    local mdefBonus = caster:getMerit(dsp.merit.BAR_SPELL_EFFECT) + caster:getMod(dsp.mod.BARSPELL_MDEF_BONUS);
    local duration = 150;

    if (enhanceSkill > 180) then
        duration = 150 + 0.8 * (enhanceSkill - 180);
    end

    if (caster:hasStatusEffect(dsp.effect.COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    target:addStatusEffect(dsp.effect.BARSTONE,power,0,duration,0,mdefBonus);

    return dsp.effect.BARSTONE;
end;
