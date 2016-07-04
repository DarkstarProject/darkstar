-----------------------------------------
-- ID: 18151
-- Item: Bloody Bolt
-- Additional Effect: Drains HP
-----------------------------------------
require("scripts/globals/status");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)
    local chance = 95;
    if (target:getMainLvl() > player:getMainLvl()) then
        chance = chance - 5 * (target:getMainLvl() - player:getMainLvl())
        chance = utils.clamp(chance, 5, 95);
    end
    if (math.random(0,99) >= chance or target:isUndead()) then
        return 0,0,0;
    else
        local diff = player:getStat(MOD_INT) - target:getStat(MOD_INT);
        if (diff > 20) then
            diff = 20 + (diff - 20) / 2;
        end
        local drain = diff + (player:getMainLvl() - target:getMainLvl()) + damage/2;
        local params = {};
        params.bonusmab = 0;
        params.includemab = false;
        drain = addBonusesAbility(player, ELE_DARK, target, drain, params);
        drain = drain * applyResistanceAddEffect(player,target,ELE_DARK,0);
        drain = adjustForTarget(target,drain,ELE_DARK);
        if (drain < 0) then
            drain = 0
        end
        drain = finalMagicNonSpellAdjustments(player,target,ELE_DARK,drain);
        return SUBEFFECT_HP_DRAIN, MSGBASIC_ADD_EFFECT_HP_DRAIN,player:addHP(drain);
    end
end;