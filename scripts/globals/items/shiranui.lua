-----------------------------------------
-- ID: 17774
-- Item: Shiranui
-- Additional Effect: Light Damage (night time only)
-----------------------------------------
require("scripts/globals/status");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)
    if (VanadielHour() >= 18 or VanadielHour() <= 6) then
        local chance = 15;
        if (math.random(0,99) >= chance) then
            return 0,0,0;
        else
            local dmg = math.random(9,11);
            local params = {};
            params.bonusmab = 0;
            params.includemab = false;
            dmg = addBonusesAbility(player,ELE_LIGHT,target,dmg,params);
            dmg = dmg * applyResistanceAddEffect(player,target,ELE_LIGHT,0);
            dmg = adjustForTarget(target,dmg,ELE_LIGHT);
            dmg = finalMagicNonSpellAdjustments(player,target,ELE_LIGHT,dmg);

            local message = MSGBASIC_ADD_EFFECT_DMG;
            if (dmg < 0) then
                message = MSGBASIC_ADD_EFFECT_HEAL;
            end

            return SUBEFFECT_LIGHT_DAMAGE, message, dmg;
        end
    else
        return 0,0,0;
    end
end;