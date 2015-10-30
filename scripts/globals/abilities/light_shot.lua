-----------------------------------
-- Ability: Light Shot
-- Consumes a Light Card to enhance light-based debuffs. Additional effect: Light-based Sleep
-- Dia Effect: Defense Down Effect +5% and DoT + 1
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAbilityCheck
-----------------------------------

function onAbilityCheck(player,target,ability)
    --ranged weapon/ammo: You do not have an appropriate ranged weapon equipped.
    --no card: <name> cannot perform that action.
    if (player:getWeaponSkillType(SLOT_RANGED) ~= SKILL_MRK or player:getWeaponSkillType(SLOT_AMMO) ~= SKILL_MRK) then
        return 216,0;
    end
    if (player:hasItem(2182, 0) or player:hasItem(2974, 0)) then
        return 0,0;
    else
        return 71, 0;
    end
end;

-----------------------------------
-- onUseAbility
-----------------------------------

function onUseAbility(player,target,ability)
    
    local duration = 60;
    local resist = applyResistanceAbility(player,target,ELE_LIGHT,SKILL_MRK, (player:getStat(MOD_AGI)/2) + player:getMerit(MERIT_QUICK_DRAW_ACCURACY));
    
    if (resist < 0.5) then
        ability:setMsg(324);--resist message
        return EFFECT_SLEEP_I;
    end
    
    duration = duration * resist;
    
    local effects = {};
    local counter = 1;
    local dia = target:getStatusEffect(EFFECT_DIA);
    if (dia ~= nil) then
        effects[counter] = dia;
        counter = counter + 1;
    end
    local threnody = target:getStatusEffect(EFFECT_THRENODY);
    if (threnody ~= nil and threnody:getSubPower() == MOD_DARKRES) then
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
        power = power * 1.5;
        subpower = subpower * 1.5;
        target:delStatusEffectSilent(effectId);
        target:addStatusEffect(effectId, power, tick, duration, subId, subpower, tier);
        local newEffect = target:getStatusEffect(effectId);
        newEffect:setStartTime(startTime);
    end
    
    if (target:addStatusEffect(EFFECT_SLEEP_I,1,0,duration)) then
        ability:setMsg(127);
    else
        ability:setMsg(323);
    end

    target:updateClaim(player);
    return EFFECT_SLEEP_I;
end;