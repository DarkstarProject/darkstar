-----------------------------------------
-- Spell: Blade Madrigal
-- Gives party members accuracy
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

    local acc = caster:getSkillLevel(SINGING_SKILL) / 16 + 1;
    local sItem = caster:getEquipID(2);
    local duration = 120;

    if(sItem == 17348) then
        acc = acc + 2;
    end

    -- traversiere + 1
    if(sItem == 17375 or sItem == 17845) then
        acc = acc + 4;
    end

    -- Until someone finds a way to delete Effects by tier we should not allow bard spells to stack.
    -- Since all the tiers use the same effect buff it is hard to delete a specific one.
    target:addStatusEffect(EFFECT_MADRIGAL,acc,0,duration);
    spell:setMsg(230);

    return EFFECT_MADRIGAL;
end;