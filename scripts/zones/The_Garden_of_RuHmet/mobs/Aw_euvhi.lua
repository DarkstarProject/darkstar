-----------------------------------
-- Area: The Garden of Ru'Hmet
-- NPC:  Aw'Euvhi
-----------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------
-- onMobSpawn Action
-- Set a random animation when it spawns
-----------------------------------

function onMobSpawn(mob)
    mob:AnimationSub(math.random(1,4));
end;

-----------------------------------
-- onMobFight Action
-- Randomly change forms 
-----------------------------------

function onMobFight(mob)
    -- Forms: 0 = Closed  1 = Closed  2 = Open 3 = Closed 
    -- According to http://wiki.ffxiclopedia.org/wiki/Category:Euvhi 
    -- ..when attacked will change states every minute or so..
    local randomTime = math.random(50,75);
    local changeTime = mob:getLocalVar("changeTime");
    
    if (mob:getBattleTime() - changeTime > randomTime) then
        if (mob:AnimationSub() == 2) then
            mob:AnimationSub(1);
        else
            mob:AnimationSub(2);
        end
        mob:setLocalVar("changeTime", mob:getBattleTime());
        
        -- According to http://wiki.ffxiclopedia.org/wiki/Category:Euvhi 
        -- When in an open state, damage taken by the Euvhi is doubled. Inflicting a large amount of damage to an Euvhi in an open state will cause it to close.
        -- Make everything do double
        if (mob:AnimationSub() == 2) then
            mob:setMod(MOD_HTHRES,2000);
            mob:setMod(MOD_SLASHRES,2000);
            mob:setMod(MOD_PIERCERES,2000);
            mob:setMod(MOD_IMPACTRES,2000);
            for n =1,table.getn (resistMod),1 do
                mob:setMod(resistMod[n],2000); 
            end
            for n =1,table.getn (defenseMod),1 do
                mob:setMod(defenseMod[n],-1000);
            end 
        else -- Reset all damage types
            mob:setMod(MOD_HTHRES,1000);
            mob:setMod(MOD_SLASHRES,1000);
            mob:setMod(MOD_PIERCERES,1000);
            mob:setMod(MOD_IMPACTRES,1000);
            for n =1,table.getn (resistMod),1 do
                mob:setMod(resistMod[n],1000); 
            end
            for n =1,table.getn (defenseMod),1 do
                mob:setMod(defenseMod[n],1000);
            end 
        end
    end
end;

-----------------------------------
-- onCriticalHit
-----------------------------------

function onCriticalHit(target)
    -- According to http://wiki.ffxiclopedia.org/wiki/Category:Euvhi 
    -- When in an open state, damage taken by the Euvhi is doubled. Inflicting a large amount of damage to an Euvhi in an open state will cause it to close.
    -- Crit is really the only thing we can do.
    if (target:AnimationSub() == 2) then
        target:AnimationSub(0);
    end
end


-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
end;
