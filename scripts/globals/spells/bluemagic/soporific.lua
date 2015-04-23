-----------------------------------------
-- Spell: Soporific
-- Puts all enemies within range to sleep
-- Spell cost: 38 MP
-- Monster Type: Plantoids
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 4
-- Stat Bonus: HP-5, MP+5
-- Level: 24
-- Casting Time: 3 seconds
-- Recast Time: 90 seconds
-- Duration: 90 seconds
-- Magic Bursts on: Compression, Gravitation, and Darkness
-- Combos: Clear Mind
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnMagicCastingCheck
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onSpellCast(caster,target,spell)

    local duration = 90;
    local typeEffect = EFFECT_SLEEP_II;
    local pINT = caster:getStat(MOD_INT);
    local mINT = target:getStat(MOD_INT);
    local dINT = (pINT - mINT);
    local resm = applyResistance(caster,spell,target,dINT,BLUE_SKILL,0);
    
    if(resm < 0.5) then
        spell:setMsg(85);--resist message
        return typeEffect;
    end

    duration = duration * resm;


    if(target:hasStatusEffect(typeEffect) == true) then
        spell:setMsg(75);
    else
        target:addStatusEffect(typeEffect,2,0,duration)
        spell:setMsg(236);
    end

    return typeEffect;
end;