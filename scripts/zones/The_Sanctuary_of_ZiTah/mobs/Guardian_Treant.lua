-----------------------------------
-- Area: The Sanctuary of Zi'Tah
-- MOB: Guardian Treant
-- Involved in Quest: Forge Your Destiny
-----------------------------------

require("scripts/globals/settings");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob, killer, ally)
    ally:setVar("ForgeYourDestiny_killed",1);
end;



