----------------------------------
-- Area: Gustav Tunnel
--  MOB: Nanoplasm
-----------------------------------
package.loaded["scripts/zones/Gustav_Tunnel/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Gustav_Tunnel/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local plasms = {17645801,17645802,17645803,17645804,17645805,17645806,17645807,17645808};
    local victory = true

    for i,v in ipairs(plasms) do
        local action = GetMobAction(v);
        printf("action %u",action);
        if not(action == 0 or (action >=21 and action <=23)) then
            victory = false
        end
    end

    if (victory == true) then
        player:setVar("BASTOK91",3);
    end
end;
