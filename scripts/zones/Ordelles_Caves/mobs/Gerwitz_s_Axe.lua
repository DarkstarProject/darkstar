-----------------------------------
-- Area: Ordelles Caves
-- NPC:  Gerwitz's Axe
-- Involved In Quest: Dark Puppet
-- @pos -51 0.1 3 193
-----------------------------------

require("scripts/globals/quests");

-----------------------------------
-- onMobSpawn
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

	if (killer:getVar("darkPuppetCS") >= 2) then
		killer:setVar("darkPuppetCS",3);
	end

end;