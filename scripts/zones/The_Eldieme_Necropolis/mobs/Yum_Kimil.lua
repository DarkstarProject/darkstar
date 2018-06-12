-----------------------------------
-- Area: The Eldieme Necropolis
--  MOB: Yumi Kimil
-- Involved in Quest: The Requiem (BARD AF2)
-- !pos -414 8 499 195
-----------------------------------
package.loaded["scripts/zones/The_Eldieme_Necropolis/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/The_Eldieme_Necropolis/TextIDs");
require("scripts/globals/settings");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    if (player:getVar("TheRequiemCS") == 3) then
        player:setVar("TheRequiemYumKilled",1);
    end
end;