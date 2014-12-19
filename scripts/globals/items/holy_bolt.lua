-----------------------------------------
-- ID: 18153
-- Item: Holy Bolt
-- Additional Effect: light
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)

 
    local dmg = player:getStat(MOD_MND);
    local params = {};
    params.bonusmab = 3;
    params.includemab = true;
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