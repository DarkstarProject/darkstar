-----------------------------------------
-- ID: 16777
-- Item: Death Scythe
-- Additional Effect: Drains HP
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");
-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)
    local chance = 10;

    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local power = 10;
        local params = {};
        params.bonusmab = 0;
        params.includemab = false;
        power = addBonusesAbility(player, ELE_DARK, target, power, params);
        power = power * applyResistanceAddEffect(player,target,ELE_DARK,0);
        power = adjustForTarget(target,power,ELE_DARK);
        power = finalMagicNonSpellAdjustments(player,target,ELE_DARK,power );

        if (power < 0) then
            power = 0;
        else
            player:addHP(power)
        end

        return SUBEFFECT_HP_DRAIN, MSGBASIC_ADD_EFFECT_HP_DRAIN, power;
    end
end;