-----------------------------------------
-- Spell: Barvirus
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)
    enchanceSkill = caster:getSkillLevel(34);

    power = 1 + 0.02 * enchanceSkill;

    duration = 150;

    if(enchanceSkill >180)then
        duration = 2 + 0.8 * (enchanceSkill - 180);
    end

    if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    target:addStatusEffect(EFFECT_BARVIRUS,power,0,duration,0,1);

        return EFFECT_BARVIRUS;
end;
