-----------------------------------
-- Area: Nyzul Isle (Path of Darkness)
--  MOB: Amnaf (BLU)
-----------------------------------

require("scripts/globals/status");
require("scripts/zones/Nyzul_Isle/IDs");

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    local instance = mob:getInstance();

    -- Stage 2 Adjustments
    if(instance:getProgress() >= 10) then
        -- Don't let Amnaf wander back to the original spawn position
        mob:setMobMod(MOBMOD_NO_MOVE, 1);

        -- Stage 2 starts at 50%
        local hp = mob:getHP();
        mob:setHP(hp / 2);

        -- Stage 2 Position
        mob:setPos(499,0,-491,66);

        -- Stage 2 AI Flag
        mob:setLocalVar("SegmentChanged",1);
    end

    mob:setLocalVar("DespawnSignal",0);
    mob:setUnkillable(true);
end;

-----------------------------------
-- onMobEngaged Action
-----------------------------------

function onMobEngaged(mob,target)
    -- Relax movement lock
    mob:setMobMod(MOBMOD_NO_MOVE, 0);

    -- Stage AI flags
    local form = mob:getLocalVar("SegmentChanged");
    local form1Gears = mob:getLocalVar("Form1Gears");
    local form1Gears = mob:getLocalVar("Form2Gears");

    -- 4 gears spawn on Stage 1 of the Fight
    if (form1Gears == 0) then
        local instance = mob:getInstance();
        SpawnMob(NyzulIsle.mobs[58].IMPERIAL_GEAR1,instance):updateEnmity(target);
        SpawnMob(NyzulIsle.mobs[58].IMPERIAL_GEAR2,instance):updateEnmity(target);
        SpawnMob(NyzulIsle.mobs[58].IMPERIAL_GEAR3,instance):updateEnmity(target);
        SpawnMob(NyzulIsle.mobs[58].IMPERIAL_GEAR4,instance):updateEnmity(target);
        mob:setLocalVar("Form1Gears", 1);
    end

    -- 4 more gears spawn on Stage 2 of the Fight
    if (form == 1 and form2Gears == 0) then
        local gear = SpawnMob(NyzulIsle.mobs[58].IMPERIAL_GEAR1,instance)
        gear:updateEnmity(target);
        gear = SpawnMob(NyzulIsle.mobs[58].IMPERIAL_GEAR2,instance);
        gear:updateEnmity(target);
        gear = SpawnMob(NyzulIsle.mobs[58].IMPERIAL_GEAR3,instance);
        gear:updateEnmity(target);
        gear = SpawnMob(NyzulIsle.mobs[58].IMPERIAL_GEAR4,instance);
        gear:updateEnmity(target);
        gear:setLocalVar("Form2Gears", 1);
    end

end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
    -- At 50% and 20% respectively, Amnaf disappears and the fight advances to the next stage
    if ((mob:getHPP() <= 50 and mob:getLocalVar("SegmentChanged") == 0) or
        (mob:getHPP() <= 20 and mob:getLocalVar("SegmentChanged") == 1)) then
        if (mob:getLocalVar("DespawnSignal") == 0) then
            mob:setLocalVar("DespawnSignal", 1);
            local instance = mob:getInstance();
            instance:setProgress(instance:getProgress() + 10);
        end
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local instance = mob:getInstance();
    instance:setProgress(instance:getProgress() + 10);
end;
