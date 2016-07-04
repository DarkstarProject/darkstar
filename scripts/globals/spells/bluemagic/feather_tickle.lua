-----------------------------------------
-- Spell: Feather Tickle
-- Reduces an enemy's TP
-- Spell cost: 48 MP
-- Monster Type: Birds
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 3
-- Stat Bonus: AGI+1
-- Level: 64
-- Casting Time: 4 seconds
-- Recast Time: 26 seconds
-- Magic Bursts on: Detonation, Fragmentation, and Light
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

    local dINT = caster:getStat(MOD_MND) - target:getStat(MOD_MND);
    local resist = applyResistance(caster,spell,target,dINT,BLUE_SKILL);
    local power = 300 * resist;
    
    if (target:getTP() == 0) then
        spell:setMsg(75);
    else
        target:delTP(power);
        spell:setMsg(431);
    end
    
    return tp;
end;