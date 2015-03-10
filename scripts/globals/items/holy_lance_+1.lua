-----------------------------------------
-- ID: 16880
-- Item: Holy Lance +1
-- Additional Effect: Light Damage
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
    dmg = addBonusesAbility(player, ELE_LIGHT, target, dmg, params);
    dmg = dmg * applyResistanceAddEffect(player,target,ELE_LIGHT,0);
    dmg = adjustForTarget(target,dmg,ELE_LIGHT);
	dmg = finalMagicNonSpellAdjustments(player,target,ELE_LIGHT,dmg);
    
    local message = 163;
    if (dmg < 0) then
        message = 167;
    end
    
    return SUBEFFECT_LIGHT_DAMAGE,message,dmg;
end;