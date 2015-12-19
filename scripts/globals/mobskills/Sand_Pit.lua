---------------------------------------------------
-- Sand Pit
-- Single target bind
---------------------------------------------------
require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/globals/monstertpmoves");

---------------------------------------------------

function onMobSkillCheck(target,mob,skill)
    return 0;
end;

function onMobWeaponSkill(target, mob, skill)
    local typeEffect = EFFECT_BIND;
    skill:setMsg(MobStatusEffectMove(mob, target, typeEffect, 1, 0, 30));

    if (mob:getPool() == 1318) then -- if the pool ID == Feeler Antlion ID
        local npcX = mob:getXPos();
        local npcY = mob:getYPos();
        local npcZ = mob:getZPos();
        local spawnId = 0;

        -- Spawn an Executioner Antlion. There are only 5 in the database.
        if (GetMobAction(mob:getID()+1) == ACTION_NONE) then -- if not spawned, set variable to spawn later.
            spawnId = mob:getID()+1;
        elseif (GetMobAction(mob:getID()+2) == ACTION_NONE) then
            spawnId = mob:getID()+2;
        elseif (GetMobAction(mob:getID()+3) == ACTION_NONE) then
            spawnId = mob:getID()+3;
        elseif (GetMobAction(mob:getID()+4) == ACTION_NONE) then
            spawnId = mob:getID()+4;
        elseif (GetMobAction(mob:getID()+5) == ACTION_NONE) then
            spawnId = mob:getID()+5;
        else
            spawnId = 0; -- If they are all up, then don't spawn any more.
        end;

        if (spawnId > 0) then
            local executioner = GetMobByID(spawnId);
            executioner:setSpawn(npcX-1,npcY-2,npcZ-1); -- Set its spawn location.
            SpawnMob(spawnId,120):updateEnmity(target);
        end;
    end;

    return typeEffect;
end;