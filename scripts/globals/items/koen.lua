-----------------------------------------
-- ID: 6430
-- Item: Koen
-- Additional Effect: Fire Damage
-- Enchantment: "Enfire"
-- Charges: 30 Reuse: 300 Secs
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 5;

    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local dmg = math.random(4,19);
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
    end
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