-----------------------------------
-- Area: Dynamis San d'Oria
--  MOB: Voidstreaker Butchnotch
-----------------------------------

require("scripts/globals/dynamis");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    if (alreadyReceived(player,7) == false) then
        player:addTimeToDynamis(30);
        addDynamisList(player,64);
        SpawnMob(17535385); -- 145
        SpawnMob(17535386); -- 146
        SpawnMob(17535387); -- 147
        SpawnMob(17535389); -- 149
    end
end;
