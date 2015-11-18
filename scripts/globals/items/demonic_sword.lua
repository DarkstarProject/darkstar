-----------------------------------------
-- ID: 16936
-- Item: Demonic Sword
-- Additional Effect: Darkness Damage
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
        local dmg = math.random(5,21);
        local params = {};
        params.bonusmab = 0;
        params.includemab = false;
        dmg = addBonusesAbility(player, ELE_DARK, target, dmg, params);
        dmg = dmg * applyResistanceAddEffect(player,target,ELE_DARK,0);
        dmg = adjustForTarget(target,dmg,ELE_DARK);
        dmg = finalMagicNonSpellAdjustments(player,target,ELE_DARK,dmg);

        local message = MSGBASIC_ADD_EFFECT_DMG;
        if (dmg < 0) then
            message = MSGBASIC_ADD_EFFECT_HEAL;
        end

        return SUBEFFECT_DARKNESS_DAMAGE,message,dmg;
    end
end;