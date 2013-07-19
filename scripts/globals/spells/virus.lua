-----------------------------------------
--	Spell: Virus
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
	local effect = EFFECT_PLAGUE;
	
    if(math.random(0,100) >= target:getMod(MOD_VIRUSRES)) then
		local duration = 60;

		local pINT = caster:getStat(MOD_INT);
		local mINT = target:getStat(MOD_INT);

		local dINT = (pINT - mINT);
		
        local bonus = AffinityBonus(caster, spell);
        local resist = applyResistance(caster,spell,target,dINT,ENFEEBLING_MAGIC_SKILL,bonus);
        if(resist >= 0.25) then -- effect taken
            duration = duration * resist;

            if(target:addStatusEffect(effect,5,3,duration)) then
                spell:setMsg(236);
            else
                spell:setMsg(75);
            end

        else -- resist entirely.
                spell:setMsg(85);
        end
    else
        spell:setMsg(284);
    end
    return effect;
end;