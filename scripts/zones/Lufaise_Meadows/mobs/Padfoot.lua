-----------------------------------
-- Area: Lufaise Meadows
--  MOB: Padfoot
-- !pos -43.689 0.487 -328.028 24
-- !pos 260.445 -1.761 -27.862 24
-- !pos 412.447 -0.057 -200.161 24
-- !pos -378.950 -15.742 144.215 24
-- !pos -141.523 -15.529 91.709 24
-----------------------------------
require("scripts/zones/Lufaise_Meadows/MobIDs");
-----------------------------------

function onMobSpawn(mob)
    if (mob:getID() == PADFOOT[GetServerVariable("realPadfoot")]) then
        mob:setDropID(4478);
        if (math.random(1,2) == 1) then
            SetDropRate(4478,14782,1000); -- Astral Earring
            SetDropRate(4478,14676,0);
        else
            SetDropRate(4478,14782,0);
            SetDropRate(4478,14676,1000); -- Assailants Ring
        end
    end
end;

function onMobDeath(mob, player, isKiller)
    if (isKiller) then
        local mobId = mob:getID();
        if (mobId == PADFOOT[GetServerVariable("realPadfoot")]) then
            
            local respawn = math.random(75600, 86400); -- 21-24 hours
            for _, v in pairs(PADFOOT) do
                if (v ~= mobId and GetMobByID(v):isSpawned()) then
                    DespawnMob(v);
                end
                GetMobByID(v):setRespawnTime(respawn);
            end

            mob:setDropID(2734);
            SetServerVariable("realPadfoot",math.random(1,5));
        end
    end
end;

function onMobDespawn(mob)
end;
