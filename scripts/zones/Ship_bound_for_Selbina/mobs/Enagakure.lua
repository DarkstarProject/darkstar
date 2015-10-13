-----------------------------------
-- Area: Balga Dais
-- NPC:  Enagakure
-- Involved in Quest: I'll Take the Big Box
-----------------------------------

require("scripts/globals/keyitems");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)

	if (killer:hasKeyItem(SEANCE_STAFF) and killer:getVar("Enagakure_Killed") == 0) then
		killer:setVar("Enagakure_Killed",1);
	end

end;