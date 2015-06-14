-----------------------------------------
-- ID: 17750
-- Item: Anthos Xiphos
-- Additional Effect: Water Damage
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
        local dmg = math.random(4,11);
        local params = {};
        params.bonusmab = 0;
        params.includemab = false;
        dmg = addBonusesAbility(player, ELE_WATER, target, dmg, params);
        dmg = dmg * applyResistanceAddEffect(player,target,ELE_WATER,0);
        dmg = adjustForTarget(target,dmg,ELE_WATER);
        dmg = finalMagicNonSpellAdjustments(player,target,ELE_WATER,dmg);

        local message = 163;
        if (dmg < 0) then
            message = 167;
        end

        return SUBEFFECT_WATER_DAMAGE,message,dmg;
    end
end;