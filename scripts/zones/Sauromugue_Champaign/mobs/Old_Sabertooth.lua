-----------------------------------
-- Area: Sauromuge Champaign
--  MOB: Old Sabertooth
-- Involved in Quest: The Fanged One
-- @pos 676 -10 -366 120
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)
    ally:setVar("TheFangedOne_Died",0);
end;
