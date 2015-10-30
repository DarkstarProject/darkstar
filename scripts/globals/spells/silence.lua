-----------------------------------------
-- Spell: Silence
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
    local effectType = EFFECT_SILENCE;

    if (target:hasStatusEffect(effectType)) then
        spell:setMsg(75); -- no effect
        return effectType;
    end

	--Pull base stats.
	local dMND = (caster:getStat(MOD_MND) - target:getStat(MOD_MND));

	--Duration, including resistance.  May need more research.
	local duration = 180;
	
	    if (caster:hasStatusEffect(EFFECT_SABOTEUR)) then
        duration = duration * 2;
    end
    caster:delStatusEffect(EFFECT_SABOTEUR);

	--Resist
	local resist = applyResistanceEffect(caster,spell,target,dMND,35,0,EFFECT_SILENCE);
		
    if (resist >= 0.5) then --Do it!
        if (target:addStatusEffect(effectType,1,0,duration * resist)) then
            spell:setMsg(236);
        else
            spell:setMsg(75); -- no effect
        end
    else
        spell:setMsg(85);
    end

    return effectType;

end;