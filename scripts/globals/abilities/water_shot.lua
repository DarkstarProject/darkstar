-----------------------------------
-- Ability: Water Shot
-- Consumes a Water Card to enhance water-based debuffs. Deals water-based magic damage
-- Drown Effect: Enhanced DoT and STR-
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/weaponskills");
require("scripts/globals/ability");
-----------------------------------

function onAbilityCheck(player,target,ability)
    --ranged weapon/ammo: You do not have an appropriate ranged weapon equipped.
    --no card: <name> cannot perform that action.
    if (player:getWeaponSkillType(dsp.slot.RANGED) ~= dsp.skill.MARKSMANSHIP or player:getWeaponSkillType(dsp.slot.AMMO) ~= dsp.skill.MARKSMANSHIP) then
        return 216,0;
    end
    if (player:hasItem(2181, 0) or player:hasItem(2974, 0)) then
        return 0,0;
    else
        return 71, 0;
    end
end;

function onUseAbility(player,target,ability,action)
    local params = {};
    params.includemab = true;
    local dmg = (2 * player:getRangedDmg() + player:getAmmoDmg() + player:getMod(dsp.mod.QUICK_DRAW_DMG)) * 1 + player:getMod(dsp.mod.QUICK_DRAW_DMG_PERCENT)/100;
    dmg  = addBonusesAbility(player, dsp.magic.ele.WATER, target, dmg, params);
    dmg = dmg * applyResistanceAbility(player,target,dsp.magic.ele.WATER,dsp.skill.MARKSMANSHIP, (player:getStat(dsp.mod.AGI)/2) + player:getMerit(dsp.merit.QUICK_DRAW_ACCURACY));
    dmg = adjustForTarget(target,dmg,dsp.magic.ele.WATER);
    
    local shadowsAbsorbed = 0
    if shadowAbsorb(target) then
        shadowsAbsorbed = 1
    end

    dmg = takeAbilityDamage(target, player, {}, true, dmg, dsp.slot.RANGED, 1, shadowsAbsorbed, 0, 0, action, nil);
    
    if shadowsAbsorbed == 0 then
        local effects = {};
        local counter = 1;
        local drown = target:getStatusEffect(dsp.effect.DROWN);
        if (drown ~= nil) then
            effects[counter] = drown;
            counter = counter + 1;
        end
        local poison = target:getStatusEffect(dsp.effect.POISON);
        if (poison ~= nil) then
            effects[counter] = poison;
            counter = counter + 1;
        end
        local threnody = target:getStatusEffect(dsp.effect.THRENODY);
        if (threnody ~= nil and threnody:getSubPower() == dsp.mod.FIRERES) then
            effects[counter] = threnody;
            counter = counter + 1;
        end
        
        if counter > 1 then
            local effect = effects[math.random(1, counter-1)];
            local duration = effect:getDuration();
            local startTime = effect:getStartTime();
            local tick = effect:getTick();
            local power = effect:getPower();
            local subpower = effect:getSubPower();
            local tier = effect:getTier();
            local effectId = effect:getType();
            local subId = effect:getSubType();
            power = power * 1.2;
            target:delStatusEffectSilent(effectId);
            target:addStatusEffect(effectId, power, tick, duration, subId, subpower, tier);
            local newEffect = target:getStatusEffect(effectId);
            newEffect:setStartTime(startTime);
        end
    end

    local del = player:delItem(2181, 1) or player:delItem(2974, 1)
    target:updateClaim(player);
    return dmg;
end;
