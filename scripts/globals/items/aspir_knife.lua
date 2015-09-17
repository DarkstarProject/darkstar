-----------------------------------------
-- ID: 16509
-- Item: Aspir Knife
-- Additional effect: MP Drain
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
        local drain = math.random(1,3);
        local params = {};
        params.bonusmab = 0;
        params.includemab = false;
        -- drain = addBonusesAbility(player, ELE_DARK, target, drain, params);
        drain = drain * applyResistanceAddEffect(player,target,ELE_DARK,0);
        drain = adjustForTarget(target,drain,ELE_DARK);
        drain = finalMagicNonSpellAdjustments(player,target,ELE_DARK,drain);

        if (drain > target:getMP()) then
            drain = target:getMP();
        end

        target:addMP(-drain);
        return SUBEFFECT_MP_DRAIN, MSGBASIC_ADD_EFFECT_MP_DRAIN, player:addMP(drain);
    end
end;