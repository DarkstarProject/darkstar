-----------------------------------
-- Area: 
-- NPC:  Cherry Sapling
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function OnMobSpawn(mob)
	SetServerVariable("[POP]Cemetery Cherry",0);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
	
	SetServerVariable("[POP]Cemetery Cherry",GetServerVariable("[POP]Cemetery Cherry") + 1);
	
	if(GetServerVariable("[POP]Cemetery Cherry") == 8) then
		SetServerVariable("[POP]Cemetery Cherry",0);
		SpawnMob(17555863,600); -- Pop Cemetery Cherry !
		
	end
	
end;