-----------------------------------------
-- Spell: Pollen
-- Restores HP
-- Spell cost: 8 MP
-- Monster Type: Vermin
-- Spell Type: Magical (Light)
-- Blue Magic Points: 1
-- Stat Bonus: CHR+1, HP+5
-- Level: 1
-- Casting Time: 2 seconds
-- Recast Time: 5 seconds
-- 
-- Combos: Resist Sleep
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

    local minCure = 14;
    local divisor = 1;
    local constant = -6;
    local power = getCurePowerOld(caster);
    local final = getCureFinal(caster,spell,getBaseCureOld(power,divisor,constant),minCure,true);
    
    if (power > 99) then
        divisor = 57;
        constant = 33.125;
    elseif (power > 59) then
        divisor =  2;
        constant = 9;
    end

    final = final + (final * (target:getMod(MOD_CURE_POTENCY_RCVD)/100));
    
    if (target:getAllegiance() == caster:getAllegiance() and (target:getObjType() == TYPE_PC or target:getObjType() == TYPE_MOB)) then
        --Applying server mods....
        final = final * CURE_POWER;
    end
        
    local diff = (target:getMaxHP() - target:getHP());
    if (final > diff) then
        final = diff;
    end
    target:addHP(final);

    if (target:getAllegiance() == caster:getAllegiance() and (target:getObjType() == TYPE_PC or target:getObjType() == TYPE_MOB)) then
        caster:updateEnmityFromCure(target,final);
    end
    spell:setMsg(7);
    
    return final;
end;