-----------------------------------------
-- Spell: Jettatura
-- Enemies within a fan-shaped area originating from the caster are frozen with fear
-- Spell cost: 37 MP
-- Monster Type: Birds
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 4
-- Stat Bonus: MP+15
-- Level: 48
-- Casting Time: 0.5 seconds
-- Recast Time: 2:00
-- Magic Bursts on: Compression, Gravitation, Darkness
-- Combos: None
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

    local duration = 5;
    local dINT = caster:getStat(MOD_MND) - target:getStat(MOD_MND);
    local resist = applyResistance(caster,spell,target,dINT,BLUE_SKILL);
    
    if(resist > 0.0625) then
        -- resisted!
        spell:setMsg(85);
        return 0;
    end

    if(target:hasStatusEffect(EFFECT_TERROR) == true) then
        -- no effect
        spell:setMsg(75);
    else
        target:addStatusEffect(EFFECT_TERROR,1,0,duration);
        spell:setMsg(236);
    end

    return EFFECT_TERROR;
end;
