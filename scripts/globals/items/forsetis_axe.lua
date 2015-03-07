-----------------------------------------
-- ID: 16726
-- Item: Forseti's Axe
-- Additional Effect: Wind Damage
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
	dmg = addBonusesAbility(player, ELE_WIND, target, dmg, params);
	dmg = dmg * applyResistanceAddEffect(player,target,ELE_WIND,0);
	dmg = adjustForTarget(target,dmg,ELE_WIND);
	dmg = finalMagicNonSpellAdjustments(player,target,ELE_WIND,dmg);
    
    local message = 163;
    if (dmg < 0) then
        message = 167;
    end
    
    return SUBEFFECT_WIND_DAMAGE,message,dmg;
end;