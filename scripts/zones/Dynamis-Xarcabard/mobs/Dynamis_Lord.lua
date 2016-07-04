-----------------------------------
-- Area: Dynamis Xarcabard
--  NM:  Dynamis_Lord
--
-- In OLD Dynamis, he is spawned by killing 15 Kindred NMs..
-- ..NOT by killing Ying and Yang.
--
-- In Neo Dynamis, he is spawned by trading
-- a Shrouded Bijou to the ??? in front of Castle Zvahl.
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/titles");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
    local YingID = 17330183;
    local YangID = 17330184;

    if (mob:getBattleTime() % 90 == 0 and mob:getBattleTime() >= 90) then
        if (GetMobAction(YingID) == ACTION_NONE and GetMobAction(YangID) == ACTION_NONE) then
            GetMobByID(YingID):setSpawn(-414.282,-44,20.427); -- These come from DL's spawn point when he spawns them.
            GetMobByID(YangID):setSpawn(-414.282,-44,20.427);
            SpawnMob(YingID):updateEnmity(target); -- Respawn the dragons after 90sec
            SpawnMob(YangID):updateEnmity(target);
        end
    end

    if (GetMobAction(YingID) == ACTION_ROAMING) then -- ensure that it's always going after someone, can't kite it away!
        GetMobByID(YingID):updateEnmity(target);
    end
    if (GetMobAction(YangID) == ACTION_ROAMING) then
        GetMobByID(YangID):updateEnmity(target);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    local npc = GetNPCByID(17330781); -- ID of the '???' target.
    player:addTitle(LIFTER_OF_SHADOWS);
    npc:setPos(mob:getXPos(),mob:getYPos(),mob:getZPos());
    npc:setStatus(0); -- Spawn the '???'
    DespawnMob(17330183); -- despawn dragons
    DespawnMob(17330184);
end;