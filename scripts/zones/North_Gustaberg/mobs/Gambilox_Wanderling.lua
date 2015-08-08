-----------------------------------
-- Area: North Gusberg
-- NPC:  Gambilox Wanderling
-- Quest NM - "As Thick as Thieves"
-----------------------------------

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end; 

-----------------------------------
-- OnMobDeath Action
-----------------------------------

function onMobDeath(mob,killer)

	thickAsThievesGamblingCS = killer:getVar("thickAsThievesGamblingCS");
	
	if (thickAsThievesGamblingCS == 5) then
		killer:setVar("thickAsThievesGamblingCS",6)
	end
end;