-----------------------------------------
-- ID: 17695  
-- Item: Bayard's Sword
-- Additional Effect: Evasion Down
-----------------------------------------
require("scripts/globals/status");
require("scripts/globals/magic");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------
function onAdditionalEffect(player,target,damage)
    local chance = 99;
    if (target:getMainLvl() > player:getMainLvl()) then
        chance = chance - 5 * (target:getMainLvl() - player:getMainLvl())
        chance = utils.clamp(chance, 5, 99);
    end
    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local duration = 25;
        if (target:getMainLvl() > player:getMainLvl()) then
            duration = duration - (target:getMainLvl() - player:getMainLvl())
        end
        utils.clamp(duration,1,25);
        
        if (not target:hasStatusEffect(EFFECT_EVASION_DOWN)) then
            target:addStatusEffect(EFFECT_EVASION_DOWN, 1, 0, duration);
        end
        return SUBEFFECT_EVASION_DOWN, 16, EFFECT_EVASION_DOWN;
    end
end;

