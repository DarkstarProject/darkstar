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

    local enhanceSkill = caster:getSkillLevel(ENHANCING_MAGIC_SKILL);
    local power = calculateBarspellPower(caster,enhanceSkill);
    local mdefBonus = caster:getMerit(MERIT_BAR_SPELL_EFFECT) + caster:getMod(MOD_BARSPELL_MDEF_BONUS);
    local duration = 150;

    if (enhanceSkill > 180) then
        duration = 150 + 0.8 * (enhanceSkill - 180);
    end

    if (caster:hasStatusEffect(dsp.effects.COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    target:addStatusEffect(dsp.effects.BARSTONE,power,0,duration,0,mdefBonus);

    return dsp.effects.BARSTONE;
end;
