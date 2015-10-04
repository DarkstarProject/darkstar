-----------------------------------
-- Area: Jugner Forest
-- NPC:  Knight Crab
-----------------------------------

require("scripts/globals/titles");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    SetServerVariable("[POP]King_Arthro",0);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

<<<<<<< HEAD
function onMobDespawn(mob)
    SetServerVariable("[POP]King_Arthro",GetServerVariable("[POP]King_Arthro") + 1);
=======
	if (GetServerVariable("[POP]King_Arthro") == 3) then
		SetServerVariable("[POP]King_Arthro",0);
		SpawnMob(17203216,600); -- Pop King Arthro !
	end
>>>>>>> c33d018851c3eff01ccf329842d87d4d6979648e

    if (GetServerVariable("[POP]King_Arthro") == 10) then
        SetServerVariable("[POP]King_Arthro",0);
        SpawnMob(17203216,600); -- Pop King Arthro !
    end
end;