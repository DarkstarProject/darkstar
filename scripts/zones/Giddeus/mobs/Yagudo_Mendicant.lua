-----------------------------------
-- Area: Giddeus (145)
--  MOB: Yagudo_Mendicant
-----------------------------------

require("scripts/zones/Giddeus/MobIDs");

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)

    local mobID = mob:getID();
    if (Hoo_Mjuu_the_Torrent_PH[mobID] ~= nil) then

        local ToD = GetServerVariable("[POP]Hoo_Mjuu_the_Torrent");
        local checkPH = GetServerVariable("[PH]Hoo_Mjuu_the_Torrent");
        if (ToD <= os.time() and GetMobAction(Hoo_Mjuu_the_Torrent) == 0) then
            if (math.random(1,20) == 5) then
                UpdateNMSpawnPoint(Hoo_Mjuu_the_Torrent);
                GetMobByID(Hoo_Mjuu_the_Torrent):setRespawnTime(GetMobRespawnTime(mobID));
                if (checkPH == 0) then
                    SetServerVariable("[PH]Hoo_Mjuu_the_Torrent", mobID);
                    DisallowRespawn(mobID, true);
                end
            end
        end
    end

end;

