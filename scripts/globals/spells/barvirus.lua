-----------------------------------------
-- Spell: Barvirus
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
    local meritBonus = caster:getMerit(MERIT_BAR_SPELL_EFFECT);	
    --printf("Barspell: Merit Bonus +%d", meritBonus);
    
    local enchanceSkill = caster:getSkillLevel(34);

    local power = 1 + 0.02 * enchanceSkill + meritBonus;

    local duration = 150;

    if(enchanceSkill >180)then
        duration = 150 + 0.8 * (enchanceSkill - 180);
    end

    if (caster:hasStatusEffect(EFFECT_COMPOSURE) == true and caster:getID() == target:getID()) then
        duration = duration * 3;
    end

    target:addStatusEffect(EFFECT_BARVIRUS,power,0,duration,0,1);

        return EFFECT_BARVIRUS;
end;
