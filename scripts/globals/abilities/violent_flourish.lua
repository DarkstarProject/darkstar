-----------------------------------
-- Ability: Violent Flourish
-- Stuns target with a low rate of success. Requires one Finishing Move.
-- Obtained: Dancer Level 45
-- Finishing Moves Used: 1
-- Recast Time: 0:20
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
        if (player:hasStatusEffect(dsp.effects.FINISHING_MOVE_1)) then
            player:delStatusEffect(dsp.effects.FINISHING_MOVE_1);
            return 0,0;
        elseif (player:hasStatusEffect(dsp.effects.FINISHING_MOVE_2)) then
            player:delStatusEffectSilent(dsp.effects.FINISHING_MOVE_2);
            player:addStatusEffect(dsp.effects.FINISHING_MOVE_1,1,0,7200);
            return 0,0;
        elseif (player:hasStatusEffect(dsp.effects.FINISHING_MOVE_3)) then
            player:delStatusEffectSilent(dsp.effects.FINISHING_MOVE_3);
            player:addStatusEffect(dsp.effects.FINISHING_MOVE_2,1,0,7200);
            return 0,0;
        elseif (player:hasStatusEffect(dsp.effects.FINISHING_MOVE_4)) then
            player:delStatusEffectSilent(dsp.effects.FINISHING_MOVE_4);
            player:addStatusEffect(dsp.effects.FINISHING_MOVE_3,1,0,7200);
            return 0,0;
        elseif (player:hasStatusEffect(dsp.effects.FINISHING_MOVE_5)) then
            player:delStatusEffectSilent(dsp.effects.FINISHING_MOVE_5);
            player:addStatusEffect(dsp.effects.FINISHING_MOVE_4,1,0,7200);
            return 0,0;
        else
            return msgBasic.NO_FINISHINGMOVES,0;
        end
    end
end;

function onUseAbility(player,target,ability,action)
    local hit = 4;
    --get fstr
    local fstr = fSTR(player:getStat(MOD_STR),target:getStat(MOD_VIT),player:getWeaponDmgRank());

    local params = {};
    params.atkmulti = 1;

    --apply WSC
    local weaponDamage = player:getWeaponDmg();

    if (player:getWeaponSkillType(0) == 1) then
        local h2hSkill = ((player:getSkillLevel(1) * 0.11) + 3);
        weaponDamage = player:getWeaponDmg()-3;

        weaponDamage = weaponDamage + h2hSkill;
    end

    local base = weaponDamage + fstr
    local cratio, ccritratio = cMeleeRatio(player, target, params, 0);
    local isSneakValid = player:hasStatusEffect(dsp.effects.SNEAK_ATTACK);
    if (isSneakValid and not player:isBehind(target)) then
        isSneakValid = false;
    end
    local pdif = generatePdif (cratio[1], cratio[2], true);
    local hitrate = getHitRate(player,target,true);

    if (math.random() <= hitrate or isSneakValid) then
        hit = 3;
        dmg = base * pdif;

        local spell = getSpell(252);
        local params = {};
        params.diff = 0;
        params.skillType = player:getWeaponSkillType(SLOT_MAIN);
        params.bonus = 50 - target:getMod(MOD_STUNRES) + player:getMod(MOD_VFLOURISH_MACC);
        local resist = applyResistance(player, target, spell, params);

        if resist > 0.25 then
            target:addStatusEffect(dsp.effects.STUN, 1, 0, 2);
        else
            ability:setMsg(msgBasic.JA_DAMAGE);
        end

        dmg = utils.stoneskin(target, dmg);

        target:delHP(dmg);
        target:updateEnmityFromDamage(player,dmg);

        action:animation(target:getID(), getFlourishAnimation(player:getWeaponSkillType(SLOT_MAIN)))
        action:speceffect(target:getID(), hit)
        return dmg
    else
        ability:setMsg(msgBasic.JA_MISS);
        return 0;
    end
end;
