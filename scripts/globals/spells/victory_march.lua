-----------------------------------------
-- Spell: Victory March
-- Gives party members Haste
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)

    local haste = 0;
    local sItem = caster:getEquipID(2);
    local duration = 120;

    local power = caster:getSkillLevel(SINGING_SKILL);

    -- Royal Spearman's Horn, Kingdom Horn, San d'Orian Horn  Adds +1 haste
    if(sItem == 17367 or sItem == 17836 or sItem == 17835) then
        power = power + 1;
    end

    -- Faerie Piccolo and Iron Ram Horn Adds +2 haste
    if(sItem == 17349 or sItem == 17853) then
        power = power + 2;
    end

    -- Until someone finds a way to delete Effects by tier we should not allow bard spells to stack.
    -- Since all the tiers use the same effect buff it is hard to delete a specific one.
    haste = power / 2;
    target:delStatusEffect(EFFECT_MARCH);
    target:addStatusEffect(EFFECT_MARCH,haste,0,duration);
end;