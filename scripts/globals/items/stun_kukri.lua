-----------------------------------------
-- ID: 16506
-- Item: Stun Kukri
-- Additional Effect: Stun
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)
    local chance = 3;
    if (target:getMainLvl() > player:getMainLvl()) then
        chance = chance - 5 * (target:getMainLvl() - player:getMainLvl())
        chance = utils.clamp(chance, 5, 3);
    end
    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local duration = 25;
        if (target:getMainLvl() > player:getMainLvl()) then
            duration = duration - (target:getMainLvl() - player:getMainLvl())
        end
        utils.clamp(duration,1,25);
      --  duration = duration * applyResistanceAddEffect(player,target,EFFECT_STUN,0);
        if (not target:hasStatusEffect(EFFECT_STUN)) then
            target:addStatusEffect(EFFECT_STUN, 3, 0, duration);
        end
        return SUBEFFECT_STUN, 160, EFFECT_STUN;
    end
end;