-----------------------------------------
-- Spell: Voracious Trunk
-- Steals an enemy's buff
-- Spell cost: 72 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 4
-- Stat Bonus: AGI +2
-- Level: 72
-- Casting Time: 10 seconds
-- Recast Time: 56 seconds
-- Combos: Auto Refresh
-----------------------------------------
require("scripts/globals/magic");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local resist = applyResistanceAbility(caster, target, dsp.magic.ele.WIND, 0, 0);
    local stolen = caster:stealStatusEffect(target);
    local StealChance = math.random(1,100);
    
    if (resist > 0.0625) then
        if StealChance < 90 and stolen ~= 0 then
            spell:setMsg(dsp.msg.basic.STEAL_EFFECT);
        end
    end
    
    return stolen;
end;