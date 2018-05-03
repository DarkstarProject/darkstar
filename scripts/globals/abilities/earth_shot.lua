-----------------------------------
-- Ability: Earth Shot
-- Consumes a Earth Card to enhance earth-based debuffs. Deals earth-based magic damage
-- Rasp Effect: Enhanced DoT and DEX-, Slow Effect +10%
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
    if (player:hasItem(2179, 0) or player:hasItem(2974, 0)) then
        return 0,0;
    else
        return 71, 0;
    end
end;

function onUseAbility(player,target,ability,action)
    local params = {};
    params.includemab = true;
    local dmg = (2 * player:getRangedDmg() + player:getAmmoDmg() + player:getMod(dsp.mod.QUICK_DRAW_DMG)) * 1 + player:getMod(dsp.mod.QUICK_DRAW_DMG_PERCENT)/100;
    dmg  = addBonusesAbility(player, dsp.magic.ele.EARTH, target, dmg, params);
    dmg = dmg * applyResistanceAbility(player,target,dsp.magic.ele.EARTH,dsp.skill.MARKSMANSHIP, (player:getStat(dsp.mod.AGI)/2) + player:getMerit(dsp.merit.QUICK_DRAW_ACCURACY));
    dmg = adjustForTarget(target,dmg,dsp.magic.ele.EARTH);

    local shadowsAbsorbed = 0;
    
    if shadowAbsorb(target) then
        shadowsAbsorbed = 1
    end
    
    dmg = takeAbilityDamage(target, player, {}, true, dmg, dsp.slot.RANGED, 1, shadowsAbsorbed, 0, 0, action, nil);

    if shadowsAbsorbed == 0 then
    
        local effects = {};
        local counter = 1;
        local rasp = target:getStatusEffect(dsp.effect.RASP);
        if (rasp ~= nil) then
            effects[counter] = rasp;
            counter = counter + 1;
        end
        local threnody = target:getStatusEffect(dsp.effect.THRENODY);
        if (threnody ~= nil and threnody:getSubPower() == dsp.mod.THUNDERRES) then
            effects[counter] = threnody;
            counter = counter + 1;
        end
        local slow = target:getStatusEffect(dsp.effect.SLOW);
        if (slow ~= nil) then
            effects[counter] = slow;
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

    local del = player:delItem(2179, 1) or player:delItem(2974, 1)
    target:updateClaim(player);
    return dmg;
end;
