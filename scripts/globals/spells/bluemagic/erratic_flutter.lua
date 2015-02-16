-----------------------------------------
-- Spell: Erratic Flutter
-- Overwrites Intimidate (Pugil), Sticky Thread (Crawler), and Horror Cloud (Skeleton)
-- Cannot be overwriten by Intimidate or Horror Cloud
-- Overwriten by, and cannot overwrite, Slow, Slowga, Haste, Hastega, and Spider Web
-----------------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/bluemagic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
	return 0;
end;

function onSpellCast(caster,target,spell)

    local duration = 300;
    
    if(caster:hasStatusEffect(EFFECT_DIFFUSION)) then
        local diffMerit = caster:getMerit(MERIT_DIFFUSION);
        if(diffMerit > 0) then
            duration = duration + (duration/100)* diffMerit;
        end
        caster:delStatusEffect(EFFECT_DIFFUSION);
    end
    if(target:addStatusEffect(EFFECT_HASTE_II,300,0,duration) == false) then
    	spell:setMsg(75);
    end
    return EFFECT_HASTE_II;
end;
