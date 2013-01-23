-----------------------------------------
-- Spell: Dragonfoe Mambo
-- Grants evasion bonus to all members.
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)

    local sItem = caster:getEquipID(2);
    local sLvl = caster:getSkillLevel(SINGING_SKILL); -- Gets skill level of Singing

    -- TODO: mambo bonus

    -- Until someone finds a way to delete Effects by tier we should not allow bard spells to stack.
    -- Since all the tiers use the same effect buff it is hard to delete a specific one.
    target:delStatusEffect(EFFECT_MAMBO);
    target:addStatusEffect(EFFECT_MAMBO,2,0,120);
end;