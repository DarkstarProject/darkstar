-----------------------------------------
-- ID: 17807
-- Item: Gold Musketeer's Uchigatana
-- Additional Effect: Earth Damage
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
    dmg = addBonusesAbility(player, ELE_EARTH, target, dmg, params);
    dmg = dmg * applyResistanceAddEffect(player,target,ELE_EARTH,0);
    dmg = adjustForTarget(target,dmg,ELE_EARTH);
	dmg = finalMagicNonSpellAdjustments(player,target,ELE_EARTH,dmg);
    
    local message = 163;
    if (dmg < 0) then
        message = 167;
    end
    
    return SUBEFFECT_EARTH_DAMAGE,message,dmg;
end;