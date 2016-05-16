-----------------------------------
-- Area: The Garden of Ru'Hmet
-- NPC:  Jailer_of_Faith
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    -- Give it two hour
    mob:setMod(MOBMOD_MAIN_2HOUR, 1);
    -- Change animation to open
    mob:AnimationSub(2);
end;

-----------------------------------
-- onMobFight Action
-- Randomly change forms 
-----------------------------------

function onMobFight(mob)
    -- Forms: 0 = Closed  1 = Closed  2 = Open 3 = Closed 
    local randomTime = math.random(45,180);
    local changeTime = mob:getLocalVar("changeTime");
    
    if (mob:getBattleTime() - changeTime > randomTime) then
        -- Change close to open.
        if (mob:AnimationSub() == 1) then
            mob:AnimationSub(2);
        else -- Change from open to close
            mob:AnimationSub(1);
        end
        mob:setLocalVar("changeTime", mob:getBattleTime());
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob)
end;

-----------------------------------
-- onMobDespawn
-----------------------------------

function onMobDespawn(mob)
    local qm3 = GetNPCByID(Jailer_of_Faith_QM);
    qm3:updateNPCHideTime(FORCE_SPAWN_QM_RESET_TIME);
    local qm3position = math.random(1,5);
    qm3:setPos(Jailer_of_Faith_QM_POS[qm3position][1], Jailer_of_Faith_QM_POS[qm3position][2], Jailer_of_Faith_QM_POS[qm3position][3]);
end;