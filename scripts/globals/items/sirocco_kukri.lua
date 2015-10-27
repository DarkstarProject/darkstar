-----------------------------------------
-- ID: 18018
-- Item: Sirocco Kukri
-- Additional Effect: Wind Damage
-----------------------------------------
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

    local message = MSGBASIC_ADD_EFFECT_DMG;
    if (dmg < 0) then
        message = MSGBASIC_ADD_EFFECT_HEAL;
    end

    return SUBEFFECT_WIND_DAMAGE,message,dmg;
end;