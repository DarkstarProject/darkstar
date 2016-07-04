-----------------------------------------
-- ID: 17704
-- Item: Vulcan Sword
-- Additional Effect: Fire Damage
-- Enchantment: Enfire
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
    dmg = addBonusesAbility(player, ELE_FIRE, target, dmg, params);
    dmg = dmg * applyResistanceAddEffect(player,target,ELE_FIRE,0);
    dmg = adjustForTarget(target,dmg,ELE_FIRE);
    dmg = finalMagicNonSpellAdjustments(player,target,ELE_FIRE,dmg);

    local message = MSGBASIC_ADD_EFFECT_DMG;
    if (dmg < 0) then
        message = MSGBASIC_ADD_EFFECT_HEAL;
    end

    return SUBEFFECT_FIRE_DAMAGE,message,dmg;
end;

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0;
end;

-----------------------------------------
-- OnItemUse
-----------------------------------------

function onItemUse(target)
    local effect = EFFECT_ENFIRE;
    doEnspell(target,target,nil,effect);
end;