---------------------------------------------
-- Spring Water
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
---------------------------------------------

function onAbilityCheck(player, target, ability)
    return 0,0;
end;

function onPetAbility(target, pet, skill)
    local base = 47 + pet:getMainLvl()*3;
    local tp = skill:getTP();
    if tp < 1000 then
        tp = 1000;
    end
    base = base * tp / 1000;

    if (target:getHP()+base > target:getMaxHP()) then
        base = target:getMaxHP() - target:getHP(); --cap it
    end
    target:delStatusEffect(dsp.effects.BLINDNESS);
    target:delStatusEffect(dsp.effects.POISON);
    target:delStatusEffect(dsp.effects.PARALYSIS);
    target:delStatusEffect(dsp.effects.DISEASE);
    target:delStatusEffect(dsp.effects.PETRIFICATION);
        target:wakeUp();
    target:delStatusEffect(dsp.effects.SILENCE);
    if math.random() > 0.5 then
        target:delStatusEffect(dsp.effects.SLOW);
    end
    skill:setMsg(msgBasic.SELF_HEAL);
    target:addHP(base);
    return base;
end
