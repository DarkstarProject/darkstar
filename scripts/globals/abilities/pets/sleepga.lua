-----------------------------------------
-- Sleepga
-----------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)
    local duration = 60;
    local resm = applyPlayerResistance(pet,-1,target,pet:getStat(MOD_INT)-target:getStat(MOD_INT),ELEMENTAL_MAGIC_SKILL, 5);
    if (resm < 0.5) then
        skill:setMsg(msgBasic.RESIST); -- resist message
        return dsp.effects.SLEEP_I;
    end
    duration = duration * resm;
    if (target:hasImmunity(1) or hasSleepEffects(target)) then
        --No effect
        skill:setMsg(msgBasic.SKILL_NO_EFFECT);
    else
        skill:setMsg(msgBasic.SKILL_ENFEEB);

        target:addStatusEffect(dsp.effects.SLEEP_I,1,0,duration);
    end

    return dsp.effects.SLEEP_I;
end;
