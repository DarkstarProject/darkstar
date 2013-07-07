-----------------------------------
--  Area: Giddeus (145)
--   Mob: Yagudo_Mendicant
-----------------------------------

require("scripts/zones/Giddeus/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)	

    mob = mob:getID();
    if (Hoo_Mjuu_the_Torrent_PH[mob] ~= nil) then

        ToD = GetServerVariable("[POP]Hoo_Mjuu_the_Torrent");
        if (ToD <= os.time(t) and GetMobAction(Hoo_Mjuu_the_Torrent) == 0) then
            if (math.random((1),(20)) == 5) then
                UpdateNMSpawnPoint(Hoo_Mjuu_the_Torrent);
                GetMobByID(Hoo_Mjuu_the_Torrent):setRespawnTime(GetMobRespawnTime(mob));
                SetServerVariable("[PH]Hoo_Mjuu_the_Torrent", mob);
                DeterMob(mob, true);
            end
        end
    end

end;

