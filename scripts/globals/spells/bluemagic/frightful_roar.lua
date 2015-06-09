-----------------------------------------
-- Spell: Frightful Roar
-- Weakens defense of enemies within range
-- Spell cost: 32 MP
-- Monster Type: Demon
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 3
-- Stat Bonus: AGI+2
-- Level: 50
-- Casting Time: 2 seconds
-- Recast Time: 20 seconds
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
    
    if(resist > (0.0652)) then
        -- resisted!
        spell:setMsg(85);
        return 0;
    end

    if(target:hasStatusEffect(EFFECT_DEFENSE_DOWN) == true) then
            spell:setMsg(75);
    else
        target:addStatusEffect(EFFECT_DEFENSE_DOWN,10,0,duration);
        spell:setMsg(236);
    end

    return EFFECT_DEFENSE_DOWN;
end;
