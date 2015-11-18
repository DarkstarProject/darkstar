-----------------------------------
-- Area: Caedarva Mire
-- NPC:  Aynu Kasey
-----------------------------------

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobFight
-----------------------------------

function onMobFight(mob, target)
    local swapTimer = mob:getLocalVar("swapTime");
    
    if (os.time() > swapTimer) then
        if (mob:AnimationSub() == 1) then -- swap from fists to second weapon
            mob:AnimationSub(2);
            mob:setLocalVar("swapTime", os.time() + 60)
        elseif (mob:AnimationSub() == 2) then -- swap from second weapon to fists
            mob:AnimationSub(1);
            mob:setLocalVar("swapTime", os.time() + 60)
        end
    end
end;

-----------------------------------
-- onCriticalHit
-----------------------------------

function onCriticalHit(mob)   
 
    if (math.random(100) < 10) then  -- 10% change to break the weapon on crit   
        if (mob:AnimationSub() == 0) then -- first weapon
            mob:AnimationSub(1);
            mob:setLocalVar("swapTime", os.time() + 60) -- start the timer for swapping between fists and the second weapon
        elseif (mob:AnimationSub() == 2) then -- second weapon
            mob:AnimationSub(3);
        end
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
    mob:setRespawnTime(math.random((7200),(14400)));
end;