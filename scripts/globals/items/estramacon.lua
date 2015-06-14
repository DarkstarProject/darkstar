-----------------------------------------
-- ID: 19160
-- Item: Estramacon
-- Additional Effect: TP Drain
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
        local TpDrain = math.random(1,3);
        target:addTp(-TpDrain);
        player:addTp(TpDrain);

        return SUBEFFECT_TP_DRAIN,165,TpDrain;
    end
end;