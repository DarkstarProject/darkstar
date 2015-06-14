-----------------------------------------
-- Spell: Chaotic Eye
-- Silences an enemy
-- Spell cost: 13 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 2
-- Stat Bonus: AGI+1
-- Level: 32
-- Casting Time: 3 seconds
-- Recast Time: 10 seconds
-- Magic Bursts on: Detonation, Fragmentation, and Light
-- Combos: Conserve MP
-----------------------------------------

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

    local effectType = EFFECT_SILENCE;

    if(target:hasStatusEffect(effectType)) then
        spell:setMsg(75); -- no effect
        return effectType;
    end

    if(1000 * math.random() >= target:getMod(MOD_SILENCERES)) then
        --Pull base stats.
        local dINT = (caster:getStat(MOD_INT) - target:getStat(MOD_INT));

        --Duration, including resistance.  May need more research.
        local duration = 180;

        --Resist
        local resist = applyResistanceEffect(caster,spell,target,dINT,BLUE_SKILL,0, EFFECT_SILENCE);
        
        if(resist >= 0.5) then --Do it!
            target:addStatusEffect(effectType,1,0,duration * resist);
            spell:setMsg(236);
        else
            spell:setMsg(85);
        end
    else
        spell:setMsg(85); -- resist
    end


    return effectType;
end;
