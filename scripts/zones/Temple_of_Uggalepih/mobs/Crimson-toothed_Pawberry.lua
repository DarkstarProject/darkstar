-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  Crimson-toothed Pawberry
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
	SetServerVariable("[POP]Crimson-toothed_Pawberry",os.time(t) + 900); -- 15min
end;