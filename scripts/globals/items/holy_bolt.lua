-----------------------------------------
-- ID: 18153
-- Item: Holy Bolt
-- Additional Effect: Light Damage
-- Bolt dmg is affected by light/dark staves and Chatoyant
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)
    local chance = 105;
    if (target:getMainLvl() > player:getMainLvl()) then
        chance = chance - 5 * (target:getMainLvl() - player:getMainLvl())
        chance = utils.clamp(chance, 5, 95);
    end
    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local dmg = player:getStat(MOD_MND) - target:getStat(MOD_MND);
        if (dmg > 40) then
            dmg = dmg+(dmg-40)/2;
        end
        local params = {};
        params.bonusmab = 0;
        params.includemab = false;
        dmg = addBonusesAbility(player, ELE_LIGHT, target, dmg, params);
        dmg = adjustForTarget(target,dmg,ELE_LIGHT);
        dmg = finalMagicNonSpellAdjustments(player,target,ELE_LIGHT,dmg);
        return SUBEFFECT_LIGHT_DAMAGE, MSGBASIC_ADD_EFFECT_DMG, dmg;
    end
end;