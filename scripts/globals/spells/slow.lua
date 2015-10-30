-----------------------------------------
-- Spell: Slow
-- Spell accuracy is most highly affected by Enfeebling Magic Skill, Magic Accuracy, and MND.
-- Slow's potency is calculated with the formula (150 + dMND*2)/1024, and caps at 300/1024 (~29.3%).
-- And MND of 75 is neccessary to reach the hardcap of Slow.
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
    local dMND = (caster:getStat(MOD_MND) - target:getStat(MOD_MND));

    --Power.
    local power = 150 + dMND * 2;
    if (power > 300) then
        power = 300;
    end
	
	    if (caster:hasStatusEffect(EFFECT_SABOTEUR)) then
        power = power * 2;
    end

    --Duration, including resistance.
    local duration = 120 * applyResistanceEffect(caster,spell,target,dMND,35,0,EFFECT_SLOW);
    if (duration >= 60) then --Do it!
	
	    if (caster:hasStatusEffect(EFFECT_SABOTEUR)) then
        duration = duration * 2;
    end
    caster:delStatusEffect(EFFECT_SABOTEUR);

        if (target:addStatusEffect(EFFECT_SLOW,power,0,duration, 0, 1)) then
            spell:setMsg(236);
        else
            spell:setMsg(75);
        end

    else
        spell:setMsg(85);
    end

	return EFFECT_SLOW;
end;