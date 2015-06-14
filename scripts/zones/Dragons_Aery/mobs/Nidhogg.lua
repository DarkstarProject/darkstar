-----------------------------------
-- Area: Dragons Aery
--  HNM: Nidhogg
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
end;

function onMobFight(mob, target)
    local battletime = mob:getBattleTime();
    local twohourTime = mob:getLocalVar("twohourTime");
    if (twohourTime == 0) then
        mob:setLocalVar("twohourTime",math.random(30,90));
    end
    if (battletime >= twohourTime) then
        mob:useMobAbility(700);
        -- technically aerial hurricane wing, but I'm using 700 for his two hour
        --(since I have no inclination to spend millions on a PI to cap one name you never see)
        mob:setLocalVar("twohourTime",battletime + math.random(60,120));
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

    killer:addTitle(NIDHOGG_SLAYER);

    -- Set Nidhogg's Window Open Time
    if (LandKingSystem_HQ == 0 or LandKingSystem_HQ == 2) then
        local wait = 72 * 3600
        SetServerVariable("[POP]Nidhogg", os.time(t) + wait); -- 3 days
        DeterMob(mob:getID(), true);
    end

    -- Set Fafnir's spawnpoint and respawn time (21-24 hours)
    if (LandKingSystem_NQ == 0 or LandKingSystem_NQ == 2) then
        local Fafnir = 17408018;
        SetServerVariable("[PH]Nidhogg", 0);
        DeterMob(Fafnir, false);
        UpdateNMSpawnPoint(Fafnir);
        GetMobByID(Fafnir):setRespawnTime(math.random((75600),(86400)));
    end

end;