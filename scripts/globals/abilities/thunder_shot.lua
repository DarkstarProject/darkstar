-----------------------------------
-- Ability: Thunder Shot
-- Consumes a Thunder Card to enhance lightning-based debuffs. Deals lightning-based magic damage
-- Shock Effect: Enhanced DoT and MND-
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
    if (player:getWeaponSkillType(SLOT_RANGED) ~= SKILL_MRK or player:getWeaponSkillType(SLOT_AMMO) ~= SKILL_MRK) then
        return 216,0;
    end
    if (player:hasItem(2180, 0) or player:hasItem(2974, 0)) then
        return 0,0;
    else
        return 71, 0;
    end
end;

function onUseAbility(player,target,ability,action)
    local params = {};
    params.includemab = true;
    local dmg = (2 * player:getRangedDmg() + player:getAmmoDmg() + player:getMod(MOD_QUICK_DRAW_DMG)) * 1 + player:getMod(MOD_QUICK_DRAW_DMG_PERCENT)/100;
    dmg  = addBonusesAbility(player, ELE_LIGHTNING, target, dmg, params);
    dmg = dmg * applyResistanceAbility(player,target,ELE_LIGHTNING,SKILL_MRK, (player:getStat(MOD_AGI)/2) + player:getMerit(MERIT_QUICK_DRAW_ACCURACY));
    dmg = adjustForTarget(target,dmg,ELE_LIGHTNING);
    
    local shadowsAbsorbed = 0
    if shadowAbsorb(target) then
        shadowsAbsorbed = 1
    end

    dmg = takeAbilityDamage(target, player, {}, true, dmg, SLOT_RANGED, 1, shadowsAbsorbed, 0, 0, action, nil);
    
    if shadowsAbsorbed == 0 then
        local effects = {};
        local counter = 1;
        local shock = target:getStatusEffect(dsp.effects.SHOCK);
        if (shock ~= nil) then
            effects[counter] = shock;
            counter = counter + 1;
        end
        local threnody = target:getStatusEffect(dsp.effects.THRENODY);
        if (threnody ~= nil and threnody:getSubPower() == MOD_WATERRES) then
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

    local del = player:delItem(2180, 1) or player:delItem(2974, 1)
    target:updateClaim(player);
    return dmg;
end;
