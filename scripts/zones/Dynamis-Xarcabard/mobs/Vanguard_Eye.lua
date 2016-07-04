-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  Vanguard_Eye
-- Map Position: http://images.wikia.com/ffxi/images/c/cc/Xar.jpg
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/dynamis");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob,target)
end;

-----------------------------------
-- onMobSpawn Action
-----------------------------------

function onMobSpawn(mob)
    mob:setMobMod(MOBMOD_SUPERLINK, mob:getShortID());
end;

-----------------------------------
-- onMobEngaged
-----------------------------------

function onMobEngaged(mob,target)
    dynamis.spawnGroup(mob, xarcabardList, 1);
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob, player, isKiller)
    
    local mobID = mob:getID();
    
    -- 035 039: spawn 043 when defeated
    if (mobID == 17330718 or mobID == 17330756) then
        local southTE = GetServerVariable("[DynaXarcabard]TE43_Trigger");
        local mobOffset = 0;
        if (mobID == 17330756) then -- since the mobIDs aren't sequential there isn't an easy way to handle them outside of ID checks...
            mobOffset = 1;
        end
        if (bit.band(southTE, bit.lshift(1, mobOffset)) == 0) then
            southTE = bit.bor(southTE, bit.lshift(1, mobOffset));
            if (southTE == 3) then
                SpawnMob(17330814); -- 43
                southTE = 0;
            end
            SetServerVariable("[DynaXarcabard]TE43_Trigger", southTE);
        end
    -- 057-059: spawn 60 when defeated
    elseif (mobID >= 17330827 and mobID <= 17330829) then
        local northTE = GetServerVariable("[DynaXarcabard]TE60_Trigger");
        if (bit.band(northTE, bit.lshift(1, (mobID - 17330827))) == 0) then
            northTE = bit.bor(northTE, bit.lshift(1, (mobID - 17330827)));
            if (northTE == 7) then
                SpawnMob(17330830); -- 60
                northTE = 0;
            end
            SetServerVariable("[DynaXarcabard]TE60_Trigger", northTE);
        end
    -- 114: spawn 112 when defeated
    elseif (mobID == 17326790) then
        SpawnMob(17326086);
    -- 144-149: spawn 150 when defeated
    elseif (mobID >= 17330913 and mobID <= 17330918) then
        local wallTE = GetServerVariable("[DynaXarcabard]TE150_Trigger");
        if (bit.band(wallTE, bit.lshift(1, (mobID - 17330913))) == 0) then
            wallTE = bit.bor(wallTE, bit.lshift(1, (mobID - 17330913)));
            if (wallTE == 63) then
                SpawnMob(17330919); -- 150
                wallTE = 0;
            end
            SetServerVariable("[DynaXarcabard]TE150_Trigger", wallTE);
        end
    end
end;