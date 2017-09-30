-----------------------------------
-- Area: Beadeaux (S)
--  MOB: Gold Quadav
-- Note: PH for Da'Dha Hundredmask
-----------------------------------
require("scripts/zones/Beadeaux_[S]/MobIDs");

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
    if (Da_Dha_Hundredmask_PH[mobID] ~= nil) then
        local ToD = GetServerVariable("[POP]Da_Dha_Hundredmask");
        if (ToD <= os.time() and GetMobAction(Da_Dha_Hundredmask) == 0) then
            if (math.random(1,8) == 4) then
                UpdateNMSpawnPoint(Da_Dha_Hundredmask);
                GetMobByID(Da_Dha_Hundredmask):setRespawnTime(GetMobRespawnTime(mobID));
                SetServerVariable("[PH]Da_Dha_Hundredmask", mobID);
                DisallowRespawn(mobID, true);
            end
        end
    end
end;
