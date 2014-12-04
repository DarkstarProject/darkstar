-----------------------------------
-- Area: Qu'Bia Arena
-- NPC:  Archlich Taber'quoan
-- Mission 5-1 BCNM Fight
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
	local kills=GetServerVariable("san_9_2_kills")+1;
	SetServerVariable("san_9_2_kills", kills);

	if (kills==11) then
		SpawnMob(17621014);
		SpawnMob(17621015);
		SpawnMob(17621016);
	end
end;