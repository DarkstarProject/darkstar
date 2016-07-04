-----------------------------------------
-- Spell: Curaga IV
-- Restores HP of all party members within area of effect.
-----------------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------------
-- OnSpellCast
-----------------------------------------

function onMagicCastingCheck(caster,target,spell)
    return 0;
end;

function onSpellCast(caster,target,spell)
    local minCure = 450;

    local divisor = 0.6666;
    local constant = 330;
    local power = getCurePowerOld(caster);
    if (power > 560) then
        divisor = 2.8333;
        constant = 591.2;
    elseif (power > 320) then
        divisor =  1;
        constant = 410;
    end

    local final = getCureFinal(caster,spell,getBaseCureOld(power,divisor,constant),minCure,false);

    final = final + (final * (target:getMod(MOD_CURE_POTENCY_RCVD)/100));
    
    --Applying server mods....
    final = final * CURE_POWER;
    
    local diff = (target:getMaxHP() - target:getHP());
    if (final > diff) then
        final = diff;
    end
    target:addHP(final);

    target:wakeUp();
    caster:updateEnmityFromCure(target,final);
    
    spell:setMsg(367);
    
    return final;
end;