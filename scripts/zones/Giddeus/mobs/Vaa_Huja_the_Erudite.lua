-----------------------------------
-- Area: Giddeus
-- NM:   Vaa Huja the Erudite
-- Involved in Quests: Dark Legacy
-----------------------------------

-----------------------------------
-- OnMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end; 

-----------------------------------
-- OnMobDeath Action
-----------------------------------

function onMobDeath(mob, killer)
	
	darkLegacyCS = killer:getVar("darkLegacyCS");
	
	if (darkLegacyCS == 3 or darkLegacyCS == 4) then
		killer:setVar("darkLegacyCS",5);
	end
	
end;