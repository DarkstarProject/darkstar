-----------------------------------------
-- ID: 17711
-- Item: Shiva's Shotel
-----------------------------------------

require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    local chance = 10;

    if (chance > math.random(0,99)) then
        local dmg = math.random(38,70);
        local params = {};
        params.bonusmab = 0;
        params.includemab = false;
        dmg = addBonusesAbility(player, ELE_ICE, target, dmg, params);
        dmg = dmg * applyResistanceAddEffect(player,target,ELE_ICE,0);
        dmg = adjustForTarget(target,dmg);
        dmg = finalMagicNonSpellAdjustments(player,target,ELE_ICE,dmg);

        local message = MSGBASIC_ADD_EFFECT_DMG;
        if (dmg < 0) then
            message = MSGBASIC_ADD_EFFECT_HEAL;
        end

        return SUBEFFECT_ICE_DAMAGE, message, dmg;
    else
        return 0,0,0;
    end
end;

-----------------------------------------
-- OnItemCheck
-----------------------------------------

function onItemCheck(target)
    return 0;
end;