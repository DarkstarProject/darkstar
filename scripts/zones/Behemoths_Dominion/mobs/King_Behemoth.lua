-----------------------------------
-- Area: Behemoth's Dominion
--  HNM: King Behemoth
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob)
    mob:setMobMod(MOBMOD_MAGIC_COOL, 60);
end;


-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, killer)

    killer:addTitle(BEHEMOTH_DETHRONER);

    if (math.random((1),(100)) <= 5) then -- Hardcoded "this or this item" drop rate until implemented.
        SetDropRate(1936,13566,1000); -- Defending Ring
        SetDropRate(1936,13415,0);
    else
        SetDropRate(1936,13566,0);
        SetDropRate(1936,13415,1000); -- Pixie Earring
    end
    -- Set King_Behemoth's Window Open Time
    if (LandKingSystem_HQ == 0 or LandKingSystem_HQ == 2) then
        local wait = 72 * 3600
        SetServerVariable("[POP]King_Behemoth", os.time(t) + wait); -- 3 days
        DeterMob(mob:getID(), true);
    end

    -- Set Behemoth's spawnpoint and respawn time (21-24 hours)
    if (LandKingSystem_NQ == 0 or LandKingSystem_NQ == 2) then
        SetServerVariable("[PH]King_Behemoth", 0);
        local Behemoth = 17297440;
        DeterMob(Behemoth, false);
        UpdateNMSpawnPoint(Behemoth);
        GetMobByID(Behemoth):setRespawnTime(math.random((75600),(86400)));
    end
end;

function onSpellPrecast(mob, spell)
    if (spell:getID() == 218) then
        spell:setAoE(SPELLAOE_RADIAL);
        spell:setFlag(SPELLFLAG_HIT_ALL);
        spell:setRadius(30);
        spell:setAnimation(280);
        spell:setMPCost(1);
    end
end;