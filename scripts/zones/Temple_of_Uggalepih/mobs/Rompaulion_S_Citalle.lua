-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  Rompaulion S Ciralle
-- Involved with San d'Oria quest "Knight Stalker"
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	local Cleuvarion = GetMobAction(17428807);
	-- Get credit if other NM is dead/despawned or in the process of dieing/fading out
	if (killer:getVar("KnightStalker_Progress") == 4 and (Cleuvarion == 0 or (Cleuvarion >= 20 and Cleuvarion <= 23))) then
		killer:setVar("KnightStalker_Kill",1);
	end
end;