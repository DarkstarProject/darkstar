-----------------------------------------
-- Spell: Temporal Shift
-- Enemies within range are temporarily prevented from acting
-- Spell cost: 48 MP
-- Monster Type: Luminians
-- Spell Type: Magical (Lightning)
-- Blue Magic Points: 5
-- Stat Bonus: HP+10, MP+15
-- Level: 73
-- Casting Time: 0.5 seconds
-- Recast Time: 120 seconds
-- Magic Bursts on: Impaction, Fragmentation, and Light
-- Combos: Attack Bonus
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
    local dINT = caster:getStat(MOD_INT) - target:getStat(MOD_INT);
    local resist = applyResistanceEffect(caster,spell,target,dINT,BLUE_SKILL,0,EFFECT_STUN);
    
    if(resist <= (1/16)) then
        -- resisted!
        spell:setMsg(85);
        return 0;
    end

    if(target:hasStatusEffect(EFFECT_STUN)) then
        -- no effect
        spell:setMsg(75);
    else
        target:addStatusEffect(EFFECT_STUN,2,0,duration*resist);
        spell:setMsg(236);
    end

    return EFFECT_STUN;
end;
