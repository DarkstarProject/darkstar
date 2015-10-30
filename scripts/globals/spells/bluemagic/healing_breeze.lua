-----------------------------------------
-- Spell: Healing Breeze
-- Restores HP for party members within area of effect
-- Spell cost: 55 MP
-- Monster Type: Beasts
-- Spell Type: Magical (Wind)
-- Blue Magic Points: 4
-- Stat Bonus: CHR+2, HP+10
-- Level: 16
-- Casting Time: 4.5 seconds
-- Recast Time: 15 seconds
-- 
-- Combos: Auto Regen
-----------------------------------------

require("scripts/globals/settings");
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

    local minCure = 60;
    local divisor = 0.6666;
    local constant = -45;
    local power = getCurePowerOld(caster);
    local final = getCureFinal(caster,spell,getBaseCureOld(power,divisor,constant),minCure,true);
    local diff = (target:getMaxHP() - target:getHP());

    final = final + (final * (target:getMod(MOD_CURE_POTENCY_RCVD)/100));
    
    if (power > 459) then
        divisor = 6.5;
        constant = 144.6666;
    elseif (power > 219) then
        divisor =  2;
        constant = 65;
    end
    
    if (target:getAllegiance() == caster:getAllegiance() and (target:getObjType() == TYPE_PC or target:getObjType() == TYPE_MOB)) then
        --Applying server mods....
        final = final * CURE_POWER;
    end
    
    if (final > diff) then
        final = diff;
    end
    
    target:addHP(final);
    target:wakeUp();
    caster:updateEnmityFromCure(target,final);
    spell:setMsg(7);
    
    return final;
end;