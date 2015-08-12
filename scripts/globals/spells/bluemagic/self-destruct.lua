-----------------------------------------
-- Spell: Self-Destruct
-- Sacrifices HP to damage enemies within range. Affects caster with Weakness
-- Spell cost: 100 MP
-- Monster Type: Arcana
-- Spell Type: Magical (Fire)
-- Blue Magic Points: 3
-- Stat Bonus: STR+2
-- Level: 50
-- Casting Time: 3.25 seconds
-- Recast Time: 21 seconds
-- Magic Bursts on: Liquefaction, Fusion, and Light
-- Combos: Auto Refresh
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/magic");
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

    local duration = 300;
    local playerHP = caster:getHP();
    local damage = caster:getHP() -1;

    
    if (damage > 0) then
        target:delHP(playerHP);
        caster:setHP(1);
        caster:delStatusEffect(EFFECT_WEAKNESS);
        caster:addStatusEffect(EFFECT_WEAKNESS,1,0,duration);
        
    end
    
    return damage;
end;