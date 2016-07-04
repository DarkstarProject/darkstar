--------------------------------------
--     Spell: Embrava
--     Consumes 20% of your maximum MP. Gradually restores 
--  target party member's HP and MP and increases attack speed.
--------------------------------------
 
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)

    local skill = caster:getSkillLevel(ENHANCING_MAGIC_SKILL);
    if (skill > 500) then
        skill = 500;
    end
    local regen = math.floor(skill / 7) + 1;
    local refresh = math.floor(skill / 100) + 1;
    local haste = math.floor(skill/(500/256));
    local duration = 90;
    
    target:addStatusEffect(EFFECT_EMBRAVA,regen,0,duration,0,refresh,haste);
        
    return EFFECT_EMBRAVA;
end;