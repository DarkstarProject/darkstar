-----------------------------------------
-- ID: 19006
-- Item: Tizona
-- Additional effect: MP Gain from damage dealt
-----------------------------------------

require("scripts/globals/status");

-----------------------------------
-- onAdditionalEffect Action
-----------------------------------

function onAdditionalEffect(player,target,damage)
    
    local chance = 10;
    if (math.random(0,99) >= chance) then
        return 0,0,0;
    else
        local drain = math.floor(damage * (math.random(100,200)/1000));
        player:addMP(drain);
        
        return SUBEFFECT_MP_DRAIN, 162, drain;
    end
end;