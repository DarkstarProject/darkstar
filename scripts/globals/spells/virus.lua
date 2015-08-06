-----------------------------------------
--	Spell: Virus
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)
	local effect = EFFECT_PLAGUE;
	
	local duration = 60;

	local pINT = caster:getStat(MOD_INT);
	local mINT = target:getStat(MOD_INT);

	local dINT = (pINT - mINT);
		
    local resist = applyResistanceEffect(caster,spell,target,dINT,ENFEEBLING_MAGIC_SKILL,0,effect);
    if (resist >= 0.5) then -- effect taken
        duration = duration * resist;

        if (target:addStatusEffect(effect,5,3,duration)) then
            spell:setMsg(236);
        else
            spell:setMsg(75);
        end

    else -- resist entirely.
            spell:setMsg(85);
    end

    return effect;
end;