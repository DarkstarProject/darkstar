-----------------------------------
-- Area: Castle Zvahl Keep (162)
--  MOB: Demon_Pawn
-----------------------------------

require("scripts/zones/Castle_Zvahl_Keep/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)

    mobID = mob:getID();
    if (Baronet_Romwe_PH[mobID] ~= nil) then

        ToD = GetServerVariable("[POP]Baronet_Romwe");
        if (ToD <= os.time(t) and GetMobAction(Baronet_Romwe) == 0) then
            if (math.random(1,10) == 5) then
                UpdateNMSpawnPoint(Baronet_Romwe);
                GetMobByID(Baronet_Romwe):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Baronet_Romwe", mobID);
                DeterMob(mobID, true);
            end
        end
    end

end;