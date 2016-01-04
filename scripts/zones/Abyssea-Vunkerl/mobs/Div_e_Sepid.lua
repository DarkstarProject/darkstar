-----------------------------------
-- Area: Abyssea - Vunkerl
--  MOB: Div-e Sepid
-- ID: 17666515
-- Note: No position data in the database (won't spawn)
-----------------------------------

require("scripts/globals/status");
    
-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob, target)
end;

-----------------------------------
-- onCriticalHit
-----------------------------------

function onCriticalHit(mob)   
 
    if (math.random(100) < 20 and mob:AnimationSub() == 0) then  -- 20% change to break that horn on crit   
        mob:AnimationSub(1);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer, ally)
end;
