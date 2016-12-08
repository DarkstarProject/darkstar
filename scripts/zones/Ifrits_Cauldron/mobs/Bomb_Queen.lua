-----------------------------------
-- Area: Ifrit's Cauldron
--  MOB: Bomb Queen
-----------------------------------

require("scripts/globals/status");

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_HP_STANDBACK, -1);
    mob:setMobMod(MOBMOD_DRAW_IN, 1);
    mob:setMobMod(MOBMOD_IDLE_DESPAWN, 180);
end;

function onMobSpawn(mob)
    mob:addMod(MOD_STUNRES, 50);
end;

function onMobFight(mob,target)
    local battleTime = mob:getBattleTime();
    local readyForSpawn = true;

    if (battleTime > 20 and battleTime % 25 == 0) then
        for summonID = mob:getID()+1, mob:getID()+5 do
            if (not GetMobByID(summonID):isDead()) then
                readyForSpawn = false;
            end
        end

        if (readyForSpawn) then
            local summon;

            repeat
                summon = GetMobByID(mob:getID() + math.random(1,5));
            until (not summon:isSpawned())

            summon:setSpawn(mob:getXPos()-0.5, mob:getYPos(), mob:getZPos(), mob:getRotPos());
            summon:spawn();
            summon:updateEnmity(target);
        end
    end
end;

function onMobDeath(mob, player, isKiller)
end;

function onMobDespawn(mob)
    GetNPCByID(17617180):updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
end;
