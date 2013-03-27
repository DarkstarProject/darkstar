-----------------------------------
-- Area: Xarcabard
-- NPC:  Koenigstiger
-- Involved in Quests: Unbridled Passion (RNG AF3)
-- @zone 112
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

function onMobDeath(mob, killer)

	local UnbridledPassionCS = killer:getVar("unbridledPassion");		

	if (UnbridledPassionCS == 4) then
		killer:setVar("unbridledPassion",5);		
	end

end;