-----------------------------------
-- Area: Jugner Forest
--  MOB: Knight Crab
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

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    SetServerVariable("[POP]King_Arthro",GetServerVariable("[POP]King_Arthro") + 1);

    if (GetServerVariable("[POP]King_Arthro") == 10) then
        SetServerVariable("[POP]King_Arthro",0);
        SpawnMob(17203216); -- Pop King Arthro !
    end
end;