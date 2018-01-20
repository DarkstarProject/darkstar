-----------------------------------
-- Area: Mamook
--  MOB: Gulool Ja Ja
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/zones/Mamook/MobIDs");

-----------------------------------

function onMobSpawn(mob)
    mob:setLocalVar("1Hour", math.random(3,5)); 
    mob:setMod(MOD_DOUBLE_ATTACK, 20);
end;

function onMobEngaged(mob,target)
    for i = 17043876, 17043879, 1 do
        SpawnMob(i):updateEnmity(target);
    end
end;

function onMobFight(mob, target)
    local petIDs = {17043876,17043877,17043878,17043879};
    local petStatus = {GetMobAction(petIDs[1]),GetMobAction(petIDs[2]),GetMobAction(petIDs[3]),GetMobAction(petIDs[4])};
    local HPP = mob:getHPP();

    if (mob:getLocalVar("use1Hour") == 0) then
        if (HPP <= mob:getLocalVar("1Hour")) then
            mob:useMobAbility(731); -- Mijin Gakure
            mob:setLocalVar("use1Hour", 1);
        end
    end

    if (mob:getBattleTime() % 15 < 2 and mob:getBattleTime() > 10) then
        if (GetMobAction(Gulool_Ja_Ja+1) == 0) then
            GetMobByID(Gulool_Ja_Ja+1):setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5));
            SpawnMob(Gulool_Ja_Ja+1):updateEnmity(target);
        elseif (GetMobAction(Gulool_Ja_Ja+2) == 0) then
            GetMobByID(Gulool_Ja_Ja+2):setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5));
            SpawnMob(Gulool_Ja_Ja+2):updateEnmity(target);
        elseif (GetMobAction(Gulool_Ja_Ja+3) == 0) then
            GetMobByID(Gulool_Ja_Ja+3):setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5));
            SpawnMob(Gulool_Ja_Ja+3):updateEnmity(target);
        elseif (GetMobAction(Gulool_Ja_Ja+4) == 0) then
            GetMobByID(Gulool_Ja_Ja+4):setSpawn(mob:getXPos()+math.random(1,5), mob:getYPos(), mob:getZPos()+math.random(1,5));
            SpawnMob(Gulool_Ja_Ja+4):updateEnmity(target);
        end
    end
    for i = 1, 4 do
        if petStatus[i] == 16 then
            GetMobByID(petIDs[i]):updateEnmity(target);
        end
    end
end;

function onMobDisengage(mob)
    for i = 1,4 do DespawnMob(Gulool_Ja_Ja + i) end
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(SHINING_SCALE_RIFLER);
    for i = 1,4 do DespawnMob(Gulool_Ja_Ja + i) end
end;

function onMobDespawn(mob)
    for i = 1,4 do DespawnMob(Gulool_Ja_Ja + i) end
end;