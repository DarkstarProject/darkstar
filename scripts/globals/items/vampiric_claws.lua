-----------------------------------------
-- ID: 17510
-- Item: Vampiric Claws
-- Additional effect: HP Drain
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 10;

    if (math.random(0,99) >= chance or target:isUndead()) then
        return 0,0,0;
    else
        local drain = math.random(3,15);
        local params = {};
        params.bonusmab = 0;
        params.includemab = false;
        -- drain = addBonusesAbility(player, ELE_DARK, target, drain, params);
        drain = drain * applyResistanceAddEffect(player,target,ELE_DARK,0);
        drain = adjustForTarget(target,drain,ELE_DARK);
        drain = finalMagicNonSpellAdjustments(player,target,ELE_DARK,drain);

        return SUBEFFECT_HP_DRAIN, MSGBASIC_ADD_EFFECT_HP_DRAIN, player:addHP(drain);
    end
end;