-----------------------------------
-- Area: Dynamis Bastok
-- NPC:  Gu'Nhi Noondozer
-- Time Extender: 30min
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
	killer:addTimeToDynamis(30);
	SetServerVariable("[DynaBastok]Already_Killed",GetServerVariable("[DynaBastok]Already_Killed") + 16);
end;