-----------------------------------
-- Ability: Despoil
-- Steal items and debuffs enemy.
-- Obtained: Thief Level 77
-- Recast Time: 5:00
-- Duration: Instant
-----------------------------------
require("scripts/global/magic");
require("scripts/globals/msg");
require("scripts/global/util");

local despoilDebuffs =
{
    EFFECT_EVASION_DOWN,
    EFFECT_DEFENSE_DOWN,
    EFFECT_ACCURACY_DOWN,
    EFFECT_ATTACK_DOWN,
    EFFECT_MAGIC_ATK_DOWN,
    EFFECT_MAGIC_DEF_DOWN,
    EFFECT_SLOW
}
--despoilDebuffs.default  = EFFECT_EVASION_DOWN;
--despoilDebuffs[644]     = EFFECT_DEFENSE_DOWN; -- Mythril Ore
--despoilDebuffs[842]     = EFFECT_ACCURACY_DOWN; -- Giant Bird Feather
--despoilDebuffs[881]     = EFFECT_DEFENSE_DOWN; -- Crab Shell
--despoilDebuffs[955]     = EFFECT_MAGIC_DEF_DOWN; -- Golem Shard
--despoilDebuffs[2334]    = EFFECT_MAGIC_ATK_DOWN; -- Poroggo Hat
--despoilDebuffs[4376]    = EFFECT_ATTACK_DOWN; -- Meat Jerky
--despoilDebuffs[4400]    = EFFECT_SLOW; -- Land Crab Meat

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

        -- Apply a random debuff for now
        -- TODO: Make this based on item stolen. We need a lot more retail data to implement that.
        local debuffIdx = math.random(#despoilDebuffs);
        local debuff = despoilDebuffs[debuffIdx];
        local power = processDebuff(player, target, ability, debuff); -- Also sets ability message
        target:addStatusEffect(debuff, power, 0, 90);
    else
        action:animation(target:getID(), 182);
        ability:setMsg(msgBasic.STEAL_FAIL); -- Failed
    end
end

function processDebuff(player, target, ability, debuff)
    local power = 10;
    if (debuff == EFFECT_ATTACK_DOWN) then
        ability:setMsg(msgBasic.DESPOIL_ATT_DOWN);
        power = 20;
    elseif (debuff == EFFECT_DEFENSE_DOWN) then
        ability:setMsg(msgBasic.DESPOIL_DEF_DOWN);
        power = 30;
    elseif (debuff == EFFECT_MAGIC_ATK_DOWN) then
        ability:setMsg(msgBasic.DESPOIL_MATT_DOWN);
    elseif (debuff == EFFECT_MAGIC_DEF_DOWN) then
        ability:setMsg(msgBasic.DESPOIL_MDEF_DOWN);
        power = 20;
    elseif (debuff == EFFECT_EVASION_DOWN) then
        ability:setMsg(msgBasic.DESPOIL_EVA_DOWN);
        power = 30;
    elseif (debuff == EFFECT_ACCURACY_DOWN) then
        ability:setMsg(msgBasic.DESPOIL_ACC_DOWN);
        power = 20;
    elseif (debuff == EFFECT_SLOW) then
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
