-----------------------------------
-- Area: Ordelles Caves
-- NPC:  Gerwitz's Soul
-- Involved In Quest: Sharpening the Sword
-- @pos -51 0.1 3 193
-----------------------------------

require("scripts/globals/quests");

-----------------------------------
-- onMobSpawn
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)

	if(killer:getVar("darkPuppetCS") >= 3) then
		killer:setVar("darkPuppetCS",4);
	end

end;