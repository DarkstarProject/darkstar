-----------------------------------
-- Area: Dragons Aery
--  HNM: Nidhogg
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

function onMobFight(mob, target)
    local battletime = mob:getBattleTime();
    if (mob:getExtraVar(1) == 0) then
        mob:setExtraVar(math.random(30,90));
    end
    if (battletime >= mob:getExtraVar(1)) then
        mob:useMobAbility(700); -- technically aerial hurricane wing, but I'm using 700 for his two hour (since I have no inclination to spend millions on a PI to cap one name you never see)
        mob:setExtraVar(battletime + math.random(60,120));
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

    killer:addTitle(NIDHOGG_SLAYER);

    -- Set Nidhogg's Window Open Time
    local wait = 72 * 3600
    SetServerVariable("[POP]Nidhogg", os.time(t) + wait); -- 3 days
    DeterMob(mob:getID(), true);
    
    -- Set Fafnir's spawnpoint and respawn time (21-24 hours)
    local Fafnir = 17408018;
    SetServerVariable("[PH]Nidhogg", 0);
    DeterMob(Fafnir, false);
    UpdateNMSpawnPoint(Fafnir);
    GetMobByID(Fafnir):setRespawnTime(math.random((75600),(86400)));

end;