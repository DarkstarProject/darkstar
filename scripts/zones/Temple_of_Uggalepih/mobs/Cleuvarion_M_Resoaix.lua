-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  Cleuvarion M Resoaix
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
	local Rompaulion = GetMobAction(17428808);
	-- Get credit if other NM is dead/despawned or in the process of dieing/fading out
	if (killer:getVar("KnightStalker_Progress") == 4 and (Rompaulion == 0 or (Rompaulion >= 20 and Rompaulion <= 23))) then
		killer:setVar("KnightStalker_Kill",1);
	end
end;