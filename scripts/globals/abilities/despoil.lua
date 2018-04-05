-----------------------------------
-- Ability: Despoil
-- Steal items and debuffs enemy.
-- Obtained: Thief Level 77
-- Recast Time: 5:00
-- Duration: Instant
-----------------------------------
require("scripts/globals/magic");
require("scripts/globals/msg");

local despoilDebuffs =
{
    dsp.effects.EVASION_DOWN,
    dsp.effects.DEFENSE_DOWN,
    dsp.effects.ACCURACY_DOWN,
    dsp.effects.ATTACK_DOWN,
    dsp.effects.MAGIC_ATK_DOWN,
    dsp.effects.MAGIC_DEF_DOWN,
    dsp.effects.SLOW
}

function onAbilityCheck(player, target, ability)
    if (player:getFreeSlotsCount() == 0) then
        return msgBasic.FULL_INVENTORY, 0;
    end
    
    return 0, 0;
end

function onUseAbility(player, target, ability, action)
    local level = player:getMainLvl(); -- Can only reach THF77 as main job
    local despoilMod = player:getMod(MOD_DESPOIL);
    local despoilChance = 50 + despoilMod * 2 + level - target:getMainLvl(); -- Same math as Steal
    
    local stolen = target:getDespoilItem();
    if (target:isMob() and math.random(100) < despoilChance and stolen ~= 0) then
        player:addItem(stolen);
        target:itemStolen();

        -- Attempt to grab the debuff from the DB
        -- If there isn't a debuff assigned to the item stolen, select one at random
        local debuff = player:getDespoilDebuff(stolen);
        if (debuff == nil) then
            debuff = despoilDebuffs[math.random(#despoilDebuffs)];
        end
        local power = processDebuff(player, target, ability, debuff); -- Also sets ability message
        target:addStatusEffect(debuff, power, 0, 90);
    else
        action:animation(target:getID(), 182);
        ability:setMsg(msgBasic.STEAL_FAIL); -- Failed
    end
    
    return stolen;
end

function processDebuff(player, target, ability, debuff)
    local power = 10;
    if (debuff == dsp.effects.ATTACK_DOWN) then
        ability:setMsg(msgBasic.DESPOIL_ATT_DOWN);
        power = 20;
    elseif (debuff == dsp.effects.DEFENSE_DOWN) then
        ability:setMsg(msgBasic.DESPOIL_DEF_DOWN);
        power = 30;
    elseif (debuff == dsp.effects.MAGIC_ATK_DOWN) then
        ability:setMsg(msgBasic.DESPOIL_MATT_DOWN);
    elseif (debuff == dsp.effects.MAGIC_DEF_DOWN) then
        ability:setMsg(msgBasic.DESPOIL_MDEF_DOWN);
        power = 20;
    elseif (debuff == dsp.effects.EVASION_DOWN) then
        ability:setMsg(msgBasic.DESPOIL_EVA_DOWN);
        power = 30;
    elseif (debuff == dsp.effects.ACCURACY_DOWN) then
        ability:setMsg(msgBasic.DESPOIL_ACC_DOWN);
        power = 20;
    elseif (debuff == dsp.effects.SLOW) then
        ability:setMsg(msgBasic.DESPOIL_SLOW);
        local dMND = player:getStat(MOD_MND) - target:getStat(MOD_MND);
        if (dMND >= 0) then
            power = 2 * dMND + 150;
        else
            power = dMND + 150;
        end
        power = utils.clamp(power, 75, 300);
    end
    
    return power;
end
