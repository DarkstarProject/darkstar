---------------------------------------------
-- Sand Pit
-- Single target bind
---------------------------------------------
require("scripts/globals/monstertpmoves");
require("scripts/globals/settings");
require("scripts/globals/status");
---------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = dsp.effects.BIND;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 30));

    if (mob:getPool() == 1318) then -- if the pool ID == Feeler Antlion ID
        local npcX = mob:getXPos();
        local npcY = mob:getYPos();
        local npcZ = mob:getZPos();
        local spawnId = 0;

        -- Spawn an Executioner Antlion. There are only 5 in the database.
        if (not GetMobByID(mob:getID()+1):isSpawned()) then -- if not spawned, set variable to spawn later.
            spawnId = mob:getID()+1;
        elseif (not GetMobByID(mob:getID()+2):isSpawned()) then
            spawnId = mob:getID()+2;
        elseif (not GetMobByID(mob:getID()+3):isSpawned()) then
            spawnId = mob:getID()+3;
        elseif (not GetMobByID(mob:getID()+4):isSpawned()) then
            spawnId = mob:getID()+4;
        elseif (not GetMobByID(mob:getID()+5):isSpawned()) then
            spawnId = mob:getID()+5;
        else
            spawnId = 0; -- If they are all up, then don't spawn any more.
        end;

        if (spawnId > 0) then
            local executioner = GetMobByID(spawnId);
            executioner:setSpawn(npcX-1,npcY-2,npcZ-1); -- Set its spawn location.
            SpawnMob(spawnId):updateEnmity(target);
        end;
    end;

    return typeEffect;
end;
