-----------------------------------------
-- ID: 16853
-- Item: Lizard Piercer  
-- Additional Effect: Ice Damage
-----------------------------------------

package.loaded["scripts/globals/magic"] = nil;
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
        local dmg = math.random(3,10);
        local params = {};
        params.bonusmab = 0;
        params.includemab = false;
        dmg = addBonusesAbility(player, ELE_ICE, target, dmg, params);
        dmg = dmg * applyResistanceAddEffect(player,target,ELE_ICE,0);
        dmg = adjustForTarget(target,dmg,ELE_ICE);
        dmg = finalMagicNonSpellAdjustments(player,target,ELE_ICE,dmg);

        local message = 163;
        if (dmg < 0) then
            message = 167;
        end

        return SUBEFFECT_ICE_DAMAGE,message,dmg;
    end
end;