-----------------------------------
-- Area: Crawler Nest (S)
--  MOB: Witch Hazel
-- Note: PH for Morille Mortelle
-----------------------------------
require("scripts/zones/Crawlers_Nest_[S]/MobIDs");

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
    if (Morille_Mortelle_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Morille_Mortelle");
        if (ToD <= os.time() and GetMobAction(Morille_Mortelle) == 0) then
            if (math.random(1,8) == 4) then
                UpdateNMSpawnPoint(Morille_Mortelle);
                GetMobByID(Morille_Mortelle):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Morille_Mortelle", mobID);
                DisallowRespawn(mobID, true);
            end
        end
    end
end;
