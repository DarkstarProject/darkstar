-----------------------------------------
-- Spell: Plasma Charge
-- Covers you with magical lightning spikes. Enemies that hit you take lightning damage
-- Spell cost: 24 MP
-- Monster Type: Luminians
-- Spell Type: Magical (Lightning)
-- Blue Magic Points: 5
-- Stat Bonus: STR+3 DEX+3
-- Level: 75
-- Casting Time: 3 seconds
-- Recast Time: 60 seconds
-- Duration: 60 seconds
-- 
-- Combos: Auto Refresh
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
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
        
    local duration = 50;

    if(caster:hasStatusEffect(EFFECT_DIFFUSION)) then
        local diffMerit = caster:getMerit(MERIT_DIFFUSION);
        
        if(diffMerit > 0) then
            duration = duration + (duration/100)* diffMerit;
        end
        
        caster:delStatusEffect(EFFECT_DIFFUSION);
    end
    
        caster:addStatusEffect(EFFECT_SHOCK_SPIKES,5,0,duration);
        spell:setMsg(230);

    return EFFECT_DEFENSE_BOOST;
end;