----------------------------------
-- Area: Grand Palace of Hu'Xzoi
--  NM:  Jailer of Temperance
-----------------------------------

require("scripts/globals/magic");
require("scripts/globals/status");

-----------------------------------
-- OnMobSpawn Action
-- Set AnimationSub to 0, put it in pot form
-- Change it's damage resists. Pot for takes Blunt, no other type
-----------------------------------

function onMobSpawn(mob)
    -- Give it two hour
    mob:setMod(MOBMOD_MAIN_2HOUR, 1);
    -- Change animation to pot
    mob:AnimationSub(0);
    -- Set the damage resists
    mob:setMod(MOD_HTHRES,1000);
    mob:setMod(MOD_SLASHRES,0);
    mob:setMod(MOD_PIERCERES,0);
    mob:setMod(MOD_IMPACTRES,1000);
    -- Set the magic resists. It always takes no damage from direct magic
    for n =1,table.getn (resistMod),1 do
        mob:setMod(resistMod[n],0);
    end
    for n =1,table.getn (defenseMod),1 do
        mob:setMod(defenseMod[n],1000);
    end
end;

-----------------------------------
-- onMobFight Action
-- Randomly change forms
-----------------------------------

function onMobFight(mob)
    -- Forms: 0 = Pot  1 = Pot  2 = Poles  3 = Rings
    local randomTime = math.random(30,180);
    local changeTime = mob:getLocalVar("changeTime");

    -- If we're in a pot form, but going to change to either Rings/Poles
    if ((mob:AnimationSub() == 0 or mob:AnimationSub() == 1) and mob:getBattleTime() - changeTime > randomTime) then
        local aniChange = math.random(2,3);
        mob:AnimationSub(aniChange);

        -- We changed to Poles. Make it only take piercing.
        if (aniChange == 2) then
            mob:setMod(MOD_HTHRES,0);
            mob:setMod(MOD_SLASHRES,0);
            mob:setMod(MOD_PIERCERES,1000);
            mob:setMod(MOD_IMPACTRES,0);
            mob:setLocalVar("changeTime", mob:getBattleTime());
        else -- We changed to Rings. Make it only take slashing.
            mob:setMod(MOD_HTHRES,0);
            mob:setMod(MOD_SLASHRES,1000);
            mob:setMod(MOD_PIERCERES,0);
            mob:setMod(MOD_IMPACTRES,0);
            mob:setLocalVar("changeTime", mob:getBattleTime());
        end
    -- We're in poles, but changing
    elseif (mob:AnimationSub() == 2 and mob:getBattleTime() - changeTime > randomTime) then
        local aniChange = math.random(0, 1);

        -- Changing to Pot, only take Blunt damage
        if (aniChange == 0) then
            mob:AnimationSub(0);
            mob:setMod(MOD_HTHRES,1000);
            mob:setMod(MOD_SLASHRES,0);
            mob:setMod(MOD_PIERCERES,0);
            mob:setMod(MOD_IMPACTRES,1000);
            mob:setLocalVar("changeTime", mob:getBattleTime());
        else -- Going to Rings, only take slashing
            mob:AnimationSub(3);
            mob:setMod(MOD_HTHRES,0);
            mob:setMod(MOD_SLASHRES,1000);
            mob:setMod(MOD_PIERCERES,0);
            mob:setMod(MOD_IMPACTRES,0);
            mob:setLocalVar("changeTime", mob:getBattleTime());
        end
    -- We're in rings, but going to change to pot or poles
    elseif (mob:AnimationSub() == 3 and mob:getBattleTime() - changeTime > randomTime) then
        local aniChange = math.random(0, 2);
        mob:AnimationSub(aniChange);

        -- We're changing to pot form, only take blunt damage.
        if (aniChange == 0 or aniChange == 1) then
            mob:setMod(MOD_HTHRES,1000);
            mob:setMod(MOD_SLASHRES,0);
            mob:setMod(MOD_PIERCERES,0);
            mob:setMod(MOD_IMPACTRES,1000);
            mob:setLocalVar("changeTime", mob:getBattleTime());
        else -- Changing to poles, only take piercing
            mob:setMod(MOD_HTHRES,0);
            mob:setMod(MOD_SLASHRES,0);
            mob:setMod(MOD_PIERCERES,1000);
            mob:setMod(MOD_IMPACTRES,0);
            mob:setLocalVar("changeTime", mob:getBattleTime());
        end
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------
function onMobDeath(mob, player, isKiller)
    SetServerVariable("[SEA]Jailer_of_Temperance_POP", os.time(t) + 900); -- 15 mins
    DeterMob(mob:getID(), true);

    -- Set PH back to normal, then set respawn time
    local PH = GetServerVariable("[SEA]Jailer_of_Temperance_PH");
    SetServerVariable("[SEA]Jailer_of_Temperance_PH", 0);
    DeterMob(PH, false);
    GetMobByID(PH):setRespawnTime(GetMobRespawnTime(PH));
end;