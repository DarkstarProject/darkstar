-----------------------------------
-- Ability: Desperate Flourish
-- Weighs down a target with a low rate of success. Requires one Finishing Move.
-- Obtained: Dancer Level 30
-- Finishing Moves Used: 1
-- Recast Time: 00:20
-- Duration: ??
-----------------------------------
require("scripts/globals/weaponskills");
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/msg");
-----------------------------------

function onAbilityCheck(player,target,ability)
    if (player:getAnimation() ~= 1) then
        return msgBasic.REQUIRES_COMBAT,0;
    else
        if (player:hasStatusEffect(EFFECT_FINISHING_MOVE_1)) then
            player:delStatusEffect(EFFECT_FINISHING_MOVE_1);
            return 0,0;
        elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_2)) then
            player:delStatusEffectSilent(EFFECT_FINISHING_MOVE_2);
            player:addStatusEffect(EFFECT_FINISHING_MOVE_1,1,0,7200);
            return 0,0;
        elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_3)) then
            player:delStatusEffectSilent(EFFECT_FINISHING_MOVE_3);
            player:addStatusEffect(EFFECT_FINISHING_MOVE_2,1,0,7200);
            return 0,0;
        elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_4)) then
            player:delStatusEffectSilent(EFFECT_FINISHING_MOVE_4);
            player:addStatusEffect(EFFECT_FINISHING_MOVE_3,1,0,7200);
            return 0,0;
        elseif (player:hasStatusEffect(EFFECT_FINISHING_MOVE_5)) then
            player:delStatusEffectSilent(EFFECT_FINISHING_MOVE_5);
            player:addStatusEffect(EFFECT_FINISHING_MOVE_4,1,0,7200);
            return 0,0;
        else
            return msgBasic.NO_FINISHINGMOVES,0;
        end
    end
end;

function onUseAbility(player,target,ability,action)

    local isSneakValid = player:hasStatusEffect(EFFECT_SNEAK_ATTACK);
    if (isSneakValid and not player:isBehind(target)) then
        isSneakValid = false;
    end

    local hitrate = getHitRate(player,target,true);

    if (math.random() <= hitrate or isSneakValid) then

        local spell = getSpell(216);
        local params = {};
        params.diff = 0;
        params.skillType = player:getWeaponSkillType(SLOT_MAIN);
        params.bonus = 50 - target:getMod(MOD_STUNRES);
        local resist = applyResistance(player, target, spell, params)

        if resist > 0.25 then
            target:delStatusEffectSilent(EFFECT_WEIGHT);
            target:addStatusEffect(EFFECT_WEIGHT, 50, 0, 60 * resist);
        else
            ability:setMsg(msgBasic.JA_DAMAGE);
        end
        ability:setMsg(msgBasic.JA_ENFEEB_IS);
        action:animation(target:getID(), getFlourishAnimation(player:getWeaponSkillType(SLOT_MAIN)))
        action:speceffect(target:getID(), 2)
        return EFFECT_WEIGHT
    else
        ability:setMsg(msgBasic.JA_MISS);
        return 0;
    end
end;
