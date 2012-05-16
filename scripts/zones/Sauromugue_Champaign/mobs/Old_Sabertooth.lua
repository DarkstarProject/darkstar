-----------------------------------
-- Area: Sauromuge Champaign
-- NPC:  Old Sabertooth
-- Involved in Quest: The Fanged One
-- @zone 120
-- @pos 676 -10 -366
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

function onMobDeath(mob, killer)
	killer:setVar("TheFangedOne_Died",0);
end;
