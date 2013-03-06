-----------------------------------------
-- Spell: Refueling
-- Overwrites Intimidate (Pugil), Sticky Thread (Crawler), and Horror Cloud (Skeleton)
-- Cannot be overwriten by Intimidate or Horror Cloud
-- Overwriten by, and cannot overwrite, Slow, Slowga, Haste, Hastega, and Spider Web
-----------------------------------------

require("scripts/globals/status");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function OnMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

    if(target:addStatusEffect(EFFECT_HASTE,102,0,300) == false) then
    	spell:setMsg(75);
    end

    return EFFECT_HASTE;
end;
