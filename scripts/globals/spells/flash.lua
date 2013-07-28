-----------------------------------------
-- Spell: Flash
-- Temporarily blinds an enemy, greatly lowering its accuracy.
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
    -- Pull base stats.
    local dINT = (caster:getStat(MOD_MND) - target:getStat(MOD_MND));

    -- apply bonus, flash is hard to fully resist
    local bonus = AffinityBonus(caster, spell:getElement()) + 200;

    local resist = applyResistance(caster,spell,target,dINT,DIVINE_MAGIC_SKILL,bonus);
    local duration = 12 * resist;

    if(resist > 0.0625) then
        if(target:addStatusEffect(EFFECT_FLASH,100,0,duration)) then
            spell:setMsg(236);
        else
            spell:setMsg(75);
        end
    else
        spell:setMsg(85);
    end
	return EFFECT_FLASH;
end;
