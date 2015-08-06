-----------------------------------
-- Area: Ordelles Caves
-- NPC:  Gerwitz's Soul
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

	if (killer:getVar("darkPuppetCS") >= 4) then
		killer:setVar("darkPuppetCS",5);
	end

end;