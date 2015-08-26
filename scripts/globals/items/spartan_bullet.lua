-----------------------------------------
-- ID: 18160
-- Item: Spartan Bullet
-- Additional Effect: Stun
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)
    local chance = 50;
    if (target:getMainLvl() > player:getMainLvl()) then
        chance = chance - 5 * (target:getMainLvl() - player:getMainLvl())
        chance = utils.clamp(chance, 5, 50);
    end
    if (math.random(0,50) >= chance or applyResistanceAddEffect(player,target,ELE_LIGHTNING,0) <= 0.5) then
        return 0,0,0;
    else
        if (not target:hasStatusEffect(EFFECT_STUN)) then
            target:addStatusEffect(EFFECT_STUN, 1, 0, 4);
        end
        return SUBEFFECT_STUN, MSGBASIC_ADD_EFFECT_STATUS, EFFECT_STUN;
    end
end;
