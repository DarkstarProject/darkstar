-----------------------------------
-- Area: Temple of Uggalepih
-- NPC:  Beryl-footed Molberry
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
	SetServerVariable("[POP]Beryl-footed_Molberry",os.time(t) + 900); -- 15min
end;