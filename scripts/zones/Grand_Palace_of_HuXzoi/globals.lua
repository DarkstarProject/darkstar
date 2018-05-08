-- Zone: Grand Palace of Hu'Xzoi (34)
-- Desc: this file contains functions that are shared by multiple luas in this zone's directory
-----------------------------------
require("scripts/zones/Grand_Palace_of_HuXzoi/MobIDs");
require("scripts/globals/status");
-----------------------------------

GRAND_PALACE_OF_HUXZOI = {
    --[[..............................................................................................
        pick new Jailer of Temperance placeholder every 15 minutes
        ..............................................................................................]]
    pickTemperancePH = function()
        local nm = GetMobByID(JAILER_OF_TEMPERANCE);
        if (not nm:isSpawned()) then
            nm:setLocalVar("ph", JAILER_OF_TEMPERANCE_PH[math.random(#JAILER_OF_TEMPERANCE_PH)]);
            nm:timer(900000, function(mob)
                if (not mob:isSpawned()) then
                    GRAND_PALACE_OF_HUXZOI.pickTemperancePH();
                end
            end);
        end
    end
}

return GRAND_PALACE_OF_HUXZOI;
