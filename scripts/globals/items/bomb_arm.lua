-----------------------------------------
-- ID: 17316
-- Item: Bomb Arm
-- Additional Effect: Fire Damage
-----------------------------------------

package.loaded["scripts/globals/magic"] = nil;
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)

    local dmg = math.random(3,10);
    local params = {};
    params.bonusmab = 0;
    params.includemab = false;
    dmg = addBonusesAbility(player, ELE_FIRE, target, dmg, params);
    dmg = dmg * applyResistanceAddEffect(player,target,ELE_FIRE,0);
    dmg = adjustForTarget(target,dmg,ELE_FIRE);
	dmg = finalMagicNonSpellAdjustments(player,target,ELE_FIRE,dmg);
    
    local message = 163;
    if (dmg < 0) then
        message = 167;
    end
    
    return SUBEFFECT_FIRE_DAMAGE,message,dmg;
end;