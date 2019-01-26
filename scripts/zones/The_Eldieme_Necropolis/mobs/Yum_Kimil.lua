-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Yumi Kimil
-- Involved in Quest: The Requiem (BARD AF2)
-- !pos -414 8 499 195
-----------------------------------
require("scripts/globals/settings");
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (player:getVar("TheRequiemCS") == 3) then
        player:setVar("TheRequiemYumKilled",1);
    end
end;