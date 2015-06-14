-----------------------------------------
-- Spell: Sandspray
-- Blinds enemies within a fan-shaped area originating from the caster
-- Spell cost: 43 MP
-- Monster Type: Beastmen
-- Spell Type: Magical (Dark)
-- Blue Magic Points: 2
-- Stat Bonus: VIT+1
-- Level: 66
-- Casting Time: 3 seconds
-- Recast Time: 90 seconds
-- Magic Bursts on: Compression, Gravitation, and Darkness
-- Combos: Clear Mind
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
    local resist = applyResistanceEffect(caster,spell,target,dINT,BLUE_SKILL,0,EFFECT_BLINDNESS);
    
    if(resist > 0.0625) then
        -- resisted!
        spell:setMsg(85);
        return 0;
    end

    if(target:hasStatusEffect(EFFECT_BLINDNESS) == true) then
        -- no effect
        spell:setMsg(75);
    else
        target:addStatusEffect(EFFECT_BLINDNESS,7,0,duration);
        spell:setMsg(236);
    end

    return EFFECT_BLINDNESS;
end;
