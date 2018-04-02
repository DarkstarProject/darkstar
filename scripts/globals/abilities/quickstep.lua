-----------------------------------
-- Ability: Quickstep
-- Lowers target's evasion. If successful, you will earn two Finishing Moves.
-- Obtained: Dancer Level 20
-- TP Required: 10%
-- Recast Time: 00:05
-- Duration: First Step lasts 1 minute, each following Step extends its current duration by 30 seconds.
-----------------------------------
require("scripts/globals/weaponskills");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getAnimation() ~= 1) then
        return msgBasic.REQUIRES_COMBAT,0;
    else
        if (player:hasStatusEffect(dsp.effects.TRANCE)) then
            return 0,0;
        elseif (player:getTP() < 100) then
            return msgBasic.NOT_ENOUGH_TP,0;
        else
            return 0,0;
        end
    end
end;

function onUseAbility(player,target,ability,action)
    -- Only remove TP if the player doesn't have Trance.
    if not player:hasStatusEffect(dsp.effects.TRANCE) then
        player:delTP(100);
    end;

    local hit = 1;
    local effect = 1;

    if math.random() <= getHitRate(player,target,true,player:getMod(MOD_STEP_ACCURACY)) then
        hit = 5;
        local mjob = player:getMainJob();
        local daze = 1;

        if (mjob == 19) then
            if (target:hasStatusEffect(dsp.effects.LETHARGIC_DAZE_1)) then
                local duration = target:getStatusEffect(dsp.effects.LETHARGIC_DAZE_1):getDuration();
                target:delStatusEffectSilent(dsp.effects.LETHARGIC_DAZE_1);
                if (player:hasStatusEffect(dsp.effects.PRESTO)) then
                    target:addStatusEffect(dsp.effects.LETHARGIC_DAZE_3,1,0,duration+30);
                    daze = 3;
                    effect = 3;
                else
                    target:addStatusEffect(dsp.effects.LETHARGIC_DAZE_2,1,0,duration+30);
                    daze = 2;
                    effect = 2;
                end

            elseif (target:hasStatusEffect(dsp.effects.LETHARGIC_DAZE_2)) then
                local duration = target:getStatusEffect(dsp.effects.LETHARGIC_DAZE_2):getDuration();
                target:delStatusEffectSilent(dsp.effects.LETHARGIC_DAZE_2);
                if (player:hasStatusEffect(dsp.effects.PRESTO)) then
                    target:addStatusEffect(dsp.effects.LETHARGIC_DAZE_4,1,0,duration+30);
                    daze = 3;
                    effect = 4;
                else
                    target:addStatusEffect(dsp.effects.LETHARGIC_DAZE_3,1,0,duration+30);
                    daze = 2;
                    effect = 3;
                end

            elseif (target:hasStatusEffect(dsp.effects.LETHARGIC_DAZE_3)) then
                local duration = target:getStatusEffect(dsp.effects.LETHARGIC_DAZE_3):getDuration();
                target:delStatusEffectSilent(dsp.effects.LETHARGIC_DAZE_3);
                if (player:hasStatusEffect(dsp.effects.PRESTO)) then
                    target:addStatusEffect(dsp.effects.LETHARGIC_DAZE_5,1,0,duration+30);
                    daze = 3;
                    effect = 5;
                else
                    target:addStatusEffect(dsp.effects.LETHARGIC_DAZE_4,1,0,duration+30);
                    daze = 2;
                    effect = 4;
                end

            elseif (target:hasStatusEffect(dsp.effects.LETHARGIC_DAZE_4)) then
                local duration = target:getStatusEffect(dsp.effects.LETHARGIC_DAZE_4):getDuration();
                target:delStatusEffectSilent(dsp.effects.LETHARGIC_DAZE_4);
                if (player:hasStatusEffect(dsp.effects.PRESTO)) then
                    daze = 3;
                else
                    daze = 2;
                end
                target:addStatusEffect(dsp.effects.LETHARGIC_DAZE_5,1,0,duration+30);
                effect = 5;

            elseif (target:hasStatusEffect(dsp.effects.LETHARGIC_DAZE_5)) then
                local duration = target:getStatusEffect(dsp.effects.LETHARGIC_DAZE_5):getDuration();
                target:delStatusEffectSilent(dsp.effects.LETHARGIC_DAZE_5);
                target:addStatusEffect(dsp.effects.LETHARGIC_DAZE_5,1,0,duration+30);
                daze = 1;
                effect = 5;

            else
                if (player:hasStatusEffect(dsp.effects.PRESTO)) then
                    target:addStatusEffect(dsp.effects.LETHARGIC_DAZE_2,1,0,60);
                    daze = 3;
                    effect = 2;
                else
                    target:addStatusEffect(dsp.effects.LETHARGIC_DAZE_1,1,0,60);
                    daze = 2;
                    effect = 1;
                end
            end;
        else
            if (target:hasStatusEffect(dsp.effects.LETHARGIC_DAZE_1)) then
                local duration = target:getStatusEffect(dsp.effects.LETHARGIC_DAZE_1):getDuration();
                target:delStatusEffectSilent(dsp.effects.LETHARGIC_DAZE_1);
                target:addStatusEffect(dsp.effects.LETHARGIC_DAZE_2,1,0,duration+30);
                effect = 2;

            elseif (target:hasStatusEffect(dsp.effects.LETHARGIC_DAZE_2)) then
                local duration = target:getStatusEffect(dsp.effects.LETHARGIC_DAZE_2):getDuration();
                target:delStatusEffectSilent(dsp.effects.LETHARGIC_DAZE_2);
                target:addStatusEffect(dsp.effects.LETHARGIC_DAZE_3,1,0,duration+30);
                effect = 3;

            elseif (target:hasStatusEffect(dsp.effects.LETHARGIC_DAZE_3)) then
                local duration = target:getStatusEffect(dsp.effects.LETHARGIC_DAZE_3):getDuration();
                target:delStatusEffectSilent(dsp.effects.LETHARGIC_DAZE_3);
                target:addStatusEffect(dsp.effects.LETHARGIC_DAZE_4,1,0,duration+30);
                effect = 4;

            elseif (target:hasStatusEffect(dsp.effects.LETHARGIC_DAZE_4)) then
                local duration = target:getStatusEffect(dsp.effects.LETHARGIC_DAZE_4):getDuration();
                target:delStatusEffectSilent(dsp.effects.LETHARGIC_DAZE_4);
                target:addStatusEffect(dsp.effects.LETHARGIC_DAZE_5,1,0,duration+30);
                effect = 5;

            elseif (target:hasStatusEffect(dsp.effects.LETHARGIC_DAZE_5)) then
                local duration = target:getStatusEffect(dsp.effects.LETHARGIC_DAZE_5):getDuration();
                target:delStatusEffectSilent(dsp.effects.LETHARGIC_DAZE_5);
                target:addStatusEffect(dsp.effects.LETHARGIC_DAZE_5,1,0,duration+30);
                effect = 5;
            else
                target:addStatusEffect(dsp.effects.LETHARGIC_DAZE_1,1,0,60);
                effect = 1;
            end;
        end

        if (player:hasStatusEffect(dsp.effects.FINISHING_MOVE_1)) then
            player:delStatusEffectSilent(dsp.effects.FINISHING_MOVE_1);
            player:addStatusEffect(dsp.effects.FINISHING_MOVE_1+daze,1,0,7200);

        elseif (player:hasStatusEffect(dsp.effects.FINISHING_MOVE_2)) then
            player:delStatusEffectSilent(dsp.effects.FINISHING_MOVE_2);
            player:addStatusEffect(dsp.effects.FINISHING_MOVE_2+daze,1,0,7200);

        elseif (player:hasStatusEffect(dsp.effects.FINISHING_MOVE_3)) then
            player:delStatusEffectSilent(dsp.effects.FINISHING_MOVE_3);
            if (daze > 2) then
                daze = 2;
            end;
            player:addStatusEffect(dsp.effects.FINISHING_MOVE_3+daze,1,0,7200);

        elseif (player:hasStatusEffect(dsp.effects.FINISHING_MOVE_4)) then
            player:delStatusEffectSilent(dsp.effects.FINISHING_MOVE_4);
            player:addStatusEffect(dsp.effects.FINISHING_MOVE_5,1,0,7200);
        elseif (player:hasStatusEffect(dsp.effects.FINISHING_MOVE_5)) then

        else
            player:addStatusEffect(dsp.effects.FINISHING_MOVE_1 - 1 + daze,1,0,7200);
        end;

    else
        ability:setMsg(msgBasic.JA_MISS);
    end

    action:animation(target:getID(), getStepAnimation(player:getWeaponSkillType(SLOT_MAIN)))
    action:speceffect(target:getID(), hit)
    return effect

end;
