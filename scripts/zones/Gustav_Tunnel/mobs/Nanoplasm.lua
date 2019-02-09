----------------------------------
-- Area: Gustav Tunnel
--   NM: Nanoplasm
-- Note: Part of mission "The Salt of the Earth"
-----------------------------------
local ID = require("scripts/zones/Gustav_Tunnel/IDs");
require("scripts/globals/missions");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (player:getCurrentMission(BASTOK) == THE_SALT_OF_THE_EARTH and player:getVar("BASTOK91") == 2) then
        local victory = true;
        for i = ID.mob.GIGAPLASM, ID.mob.GIGAPLASM + 14 do
            if (GetMobByID(i):isAlive()) then
                victory = false;
                break;
            end
        end

        if (victory) then
            player:setVar("BASTOK91", 3);
        end
    end
end;
