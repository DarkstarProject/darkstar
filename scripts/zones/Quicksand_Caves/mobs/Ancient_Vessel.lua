-----------------------------------
-- Area: Quicksand Caves
-- NPC:  Ancient Vessel
-- Mithra and the Crystal (Zilart 12) Fight
-----------------------------------

require("scripts/globals/missions");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)

	if (killer:getCurrentMission(ZILART) == THE_MITHRA_AND_THE_CRYSTAL and killer:getVar("ZilartStatus") == 1) then
		killer:needToZone(true);
		killer:setVar("AncientVesselKilled",1);
	end

end;