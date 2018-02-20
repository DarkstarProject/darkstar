-----------------------------------
-- Area: Halvung
--  MOB: Gurfurlur the Menacing
-----------------------------------
require("scripts/globals/titles");
-----------------------------------

function onMobSpawn(mob)
end;

function onMobEngaged(mob,target)

    local gurfurlur = mob:getID()
    SpawnMob(gurfurlur+1):updateEnmity(target);
    SpawnMob(gurfurlur+2):updateEnmity(target);
    SpawnMob(gurfurlur+3):updateEnmity(target);
    SpawnMob(gurfurlur+4):updateEnmity(target);

end;

function onMobFight(mob,target)

   -- Summons a guard every 15 seconds.
   -- TODO: Summon animations

    local gurfurlur = mob:getID()
    if (mob:getBattleTime() % 15 < 2 and mob:getBattleTime() > 2) then
        if (GetMobAction(gurfurlur+1) == 0) then
            GetMobByID(gurfurlur+1):setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5));
            SpawnMob(gurfurlur+1, 300):updateEnmity(target);
        elseif (GetMobAction(gurfurlur+2) == 0) then
            GetMobByID(gurfurlur+2):setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5));
            SpawnMob(gurfurlur+2, 300):updateEnmity(target);
        elseif (GetMobAction(gurfurlur+3) == 0) then
            GetMobByID(gurfurlur+3):setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5));
            SpawnMob(gurfurlur+3, 300):updateEnmity(target);
        elseif (GetMobAction(gurfurlur+4) == 0) then
            GetMobByID(gurfurlur+4):setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5));
            SpawnMob(gurfurlur+4, 300):updateEnmity(target);
        end;
    end;
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(TROLL_SUBJUGATOR);
end;
