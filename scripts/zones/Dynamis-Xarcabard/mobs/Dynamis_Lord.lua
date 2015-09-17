-----------------------------------
-- Area: Dynamis Xarcabard
--  NM:  Dynamis_Lord
-- 
-- In OLD Dynamis, he is spawned by killing 15 Kindred NMs..
-- ..NOT by killing Ying and Yang.
--
-- In Neo Dynamis, he is spawned by trading
-- a Shrouded Bijou to the ??? in front of Castle Zvahl. 
--
-- Suggested method for old school Dyna: mask bits
-- Duke Berith        bit 0
-- Marquis Decarabia  bit 1
-- Count Zaebos       bit 2
-- Duke Gomory        bit 3
-- Marquis Andras     bit 4
-- Prince Seere       bit 5
-- Count Raum         bit 6
-- Marquis Nebiros    bit 7
-- Marquis Sabnak     bit 8
-- Duke Scox          bit 9
-- Marquis Orias      bit 10
-- Marquis Gamygyn    bit 11
-- Count Vine         bit 12
-- Marquis Cimeries   bit 13
-- King Zagan         bit 14
-- Mask full = pop Dyna Lord
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

    if (mob:getBattleTime() % 90 == 0) then
        if (GetMobAction(YingID) == ACTION_NONE) then
            SpawnMob(YingID):updateEnmity(target); -- Respawn Ying after 90sec
        end
        if (GetMobAction(YangID) == ACTION_NONE) then
            SpawnMob(YangID):updateEnmity(target); -- Respawn Yang after 90sec
        end
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    local npc = GetNPCByID(17330778); -- ID of the '???' target.
    killer:addTitle(LIFTER_OF_SHADOWS);
    npc:setPos(mob:getXPos(),mob:getYPos(),mob:getZPos());
    npc:setStatus(0); -- Spawn the '???'
end;