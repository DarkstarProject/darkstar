-----------------------------------
-- Area: Qu'Bia Arena
--  NM:  Archlich Taber'quoan
-- Mission 5-1 BCNM Fight
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob, target)
    local BattleTime = mob:getBattleTime();
    local War_1 = mob:getID()+3;
    local War_2 = mob:getID()+4;
    local War_3 = mob:getID()+5;
    local War_4 = mob:getID()+6;
    -- Tries to spawn 1 group of 2 Warriors to aid Archlich every 30 sec. The sorcerers DO NOT repop.
    -- If you think they should repop, you are WRONG. If you think all 7 skelly attack at start, YOU ARE WRONG.
    if (BattleTime - mob:getLocalVar("RepopWarriors") > 30) then
        if ((GetMobAction(War_1) == ACTION_NONE or GetMobAction(War_1) == ACTION_SPAWN)
        and (GetMobAction(War_2) == ACTION_NONE or GetMobAction(War_2) == ACTION_SPAWN)) then
            SpawnMob(War_1):updateEnmity(target);
            SpawnMob(War_2):updateEnmity(target);
            mob:setLocalVar("RepopWarriors", BattleTime);
        elseif ((GetMobAction(War_1) == ACTION_NONE or GetMobAction(War_1) == ACTION_SPAWN)
        and (GetMobAction(War_3) == ACTION_NONE or GetMobAction(War_3) == ACTION_SPAWN)) then
            SpawnMob(War_1):updateEnmity(target);
            SpawnMob(War_3):updateEnmity(target);
            mob:setLocalVar("RepopWarriors", BattleTime);
        elseif ((GetMobAction(War_1) == ACTION_NONE or GetMobAction(War_1) == ACTION_SPAWN)
        and (GetMobAction(War_4) == ACTION_NONE or GetMobAction(War_4) == ACTION_SPAWN)) then
            SpawnMob(War_1):updateEnmity(target);
            SpawnMob(War_4):updateEnmity(target);
            mob:setLocalVar("RepopWarriors", BattleTime);
        elseif ((GetMobAction(War_2) == ACTION_NONE or GetMobAction(War_2) == ACTION_SPAWN)
        and (GetMobAction(War_3) == ACTION_NONE or GetMobAction(War_3) == ACTION_SPAWN)) then
            SpawnMob(War_2):updateEnmity(target);
            SpawnMob(War_3):updateEnmity(target);
            mob:setLocalVar("RepopWarriors", BattleTime);
        elseif ((GetMobAction(War_2) == ACTION_NONE or GetMobAction(War_2) == ACTION_SPAWN)
        and (GetMobAction(War_4) == ACTION_NONE or GetMobAction(War_4) == ACTION_SPAWN)) then
            SpawnMob(War_2):updateEnmity(target);
            SpawnMob(War_4):updateEnmity(target);
            mob:setLocalVar("RepopWarriors", BattleTime);
        elseif ((GetMobAction(War_3) == ACTION_NONE or GetMobAction(War_3) == ACTION_SPAWN)
        and (GetMobAction(War_4) == ACTION_NONE or GetMobAction(War_4) == ACTION_SPAWN)) then
            SpawnMob(War_3):updateEnmity(target);
            SpawnMob(War_4):updateEnmity(target);
            mob:setLocalVar("RepopWarriors", BattleTime);

        -- Can't find a pair to pop at once, so popping single (dunno if this part is retail...)
        elseif (GetMobAction(War_1) == ACTION_NONE or GetMobAction(War_1) == ACTION_SPAWN) then
            SpawnMob(War_1):updateEnmity(target);
            mob:setLocalVar("RepopWarriors", BattleTime);
        elseif (GetMobAction(War_2) == ACTION_NONE or GetMobAction(War_2) == ACTION_SPAWN) then
            SpawnMob(War_2):updateEnmity(target);
            mob:setLocalVar("RepopWarriors", BattleTime);
        elseif (GetMobAction(War_3) == ACTION_NONE or GetMobAction(War_3) == ACTION_SPAWN) then
            SpawnMob(War_3):updateEnmity(target);
            mob:setLocalVar("RepopWarriors", BattleTime);
        elseif (GetMobAction(War_4) == ACTION_NONE or GetMobAction(War_4) == ACTION_SPAWN) then
            SpawnMob(War_4):updateEnmity(target);
            mob:setLocalVar("RepopWarriors", BattleTime);
        end
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    player:addTitle(ARCHMAGE_ASSASSIN);
end;