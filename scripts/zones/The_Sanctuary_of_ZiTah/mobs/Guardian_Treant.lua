-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--  MOB: Guardian Treant
-- Involved in Quest: Forge Your Destiny
-----------------------------------
require("scripts/globals/settings");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobDeath(mob, player, isKiller)
    player:setVar("ForgeYourDestiny_killed",1);
end;



