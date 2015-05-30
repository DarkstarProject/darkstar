-----------------------------------
-- Area: Wajaom Woodlands
-- NPC:  Tinnin

-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");
require("scripts/globals/magic");
require("scripts/globals/utils");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_2HOUR_MULTI, 1);
    mob:setMobMod(MOBMOD_DRAW_IN, 1);
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    -- setMod
    mob:setMod(MOD_REGEN,100);
end;

function onMobFight(mob, target)

    local battletime = mob:getBattleTime();
    local headgrow = mob:getLocalVar("headgrow");
    local broken = mob:AnimationSub();

    if (headgrow < battletime and broken > 0) then
        mob:AnimationSub(broken - 1);
        mob:setLocalVar("headgrow", battletime + 300);
    end

end;

function onCriticalHit(mob)

    local rand = math.random();
    local battletime = mob:getBattleTime();
    local headgrow = mob:getLocalVar("headgrow");
    local headbreak = mob:getLocalVar("headbreak");
    local broken = mob:AnimationSub();

    if (rand <= 0.15 and battletime >= headbreak and broken < 2) then
        mob:AnimationSub(broken + 1);
        mob:setLocalVar("headgrow", battletime + math.random(120, 240))
        mob:setLocalVar("headbreak", battletime + 300);
    end

end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)
end;