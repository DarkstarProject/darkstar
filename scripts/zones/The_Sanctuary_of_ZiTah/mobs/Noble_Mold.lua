-----------------------------------
-- Area: The Sanctuary of Zi'Tah
--  MOB: Noble Mold
-----------------------------------

require("scripts/globals/fieldsofvalor");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    checkRegime(player, mob, 115, 1);
    checkRegime(player, mob, 116, 2);

end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    local Noble_Mold = mob:getID();
    local Noble_Mold_PH = GetServerVariable("Noble_Mold_PH");

    GetMobByID(Noble_Mold):setLocalVar("ToD",os.time() + math.random((43200), (57600)));
    SetServerVariable("Noble_Mold_PH", 0);
    DisallowRespawn(Noble_Mold, true);
    DisallowRespawn(Noble_Mold_PH, false);
    SpawnMob(Noble_Mold_PH, "", GetMobRespawnTime(Noble_Mold_PH));

end;
