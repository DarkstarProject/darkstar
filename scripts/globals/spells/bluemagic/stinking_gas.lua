-----------------------------------------
-- Spell: Stinking Gas
-- Lowers Vitality of enemies within range
-- Spell cost: 37 MP
-- Monster Type: Undead
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 2
-- Stat Bonus: AGI+1
-- Level: 44
-- Casting Time: 4 seconds
-- Recast Time: 60 seconds
-- Magic Bursts on: Detonation, Fragmentation, and Light
-- Combos: Auto Refresh
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/bluemagic");

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

    local duration = 60;
    local dINT = caster:getStat(MOD_MND) - target:getStat(MOD_MND);
    local resist = applyResistance(caster,spell,target,dINT,BLUE_SKILL);
    
    if(resist > 0.0625) then
        -- resisted!
        spell:setMsg(85);
        return 0;
    end

    if(target:hasStatusEffect(EFFECT_VIT_DOWN) == true) then
        -- no effect
        spell:setMsg(75);
    else
        target:addStatusEffect(EFFECT_VIT_DOWN,5,0,duration);
        spell:setMsg(236);
    end

    return EFFECT_VIT_DOWN;
end;
