----------------------------------
-- Area: Gustav Tunnel
--  MOB: Nanoplasm
-----------------------------------
package.loaded["scripts/zones/Gustav_Tunnel/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Gustav_Tunnel/TextIDs");
require("scripts/globals/status");

function onMobDeath(mob, player, isKiller)
    local victory = true;

    for plasm = 17645801,17645808 do
        if (not GetMobByID(plasm):isDead()) then
            victory = false;
        end
    end

    if (victory == true) then
        player:setVar("BASTOK91",3);
    end
end;
