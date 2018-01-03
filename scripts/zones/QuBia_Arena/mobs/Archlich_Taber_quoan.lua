-----------------------------------
-- Area: Qu'Bia Arena
--  NM:  Archlich Taber'quoan
-- Mission 5-1 BCNM Fight
-----------------------------------

require("scripts/globals/status");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_SOUND_RANGE, 32);
end;

function onMobSpawn(mob)
    mob:setLocalVar("jobSpecHPP", math.random(35,60));
end;

function onMobFight(mob, target)
    if (mob:getLocalVar("jobSpecUsed") == 0 and mob:getHPP() <= mob:getLocalVar("jobSpecHPP")) then
        mob:setLocalVar("jobSpecUsed", 1);
        mob:useMobAbility(jobSpec.MANAFONT);
    end

    local BattleTime = mob:getBattleTime();
    if (BattleTime - mob:getLocalVar("RepopWarriors") > 30) then
        local warriorsSpawned = 0;
        for warrior = mob:getID()+3, mob:getID()+6 do
            if (not GetMobByID(warrior):isSpawned() and warriorsSpawned < 2) then
                SpawnMob(warrior):updateEnmity(target);
                if (warriorsSpawned == 1) then
                    GetMobByID(warrior):stun(5000);
                end
                warriorsSpawned = warriorsSpawned + 1;
            end
        end

        mob:setLocalVar("RepopWarriors", BattleTime);
    end
end;

function onMobDisengage(mob, weather)
    mob:setLocalVar("jobSpecUsed", 0);
end;

function onMobDeath(mob, player, isKiller)
    player:addTitle(ARCHMAGE_ASSASSIN);
end;
