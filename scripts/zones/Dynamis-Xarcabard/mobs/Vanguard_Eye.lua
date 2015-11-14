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

function onMobDeath(mob,killer)
    
    local mobID = mob:getID();
    
    -- 035 039: spawn 043 when defeated
    if (mobID == 17330718) then
        local southTE = GetServerVariable("[DynaXarcabard]TE43_Trigger");
        if (bit.band(southTE, bit.lshift(1,0)) ~= 1) then
            SetServerVariable("[DynaXarcabard]TE43_Trigger",bit.bor(southTE, bit.lshift(1,0)))
        end
    elseif (mobID == 17330756)  then
        local southTE = GetServerVariable("[DynaXarcabard]TE43_Trigger");
        if (bit.band(southTE, bit.lshift(1,1)) ~= 1) then
            SetServerVariable("[DynaXarcabard]TE43_Trigger",bit.bor(southTE, bit.lshift(1,1)))
        end
    -- 058: spawn 60 when defeated
    elseif (mobID >= 17330827 and mobID <= 17330829) then
        local northTE = GetServerVariable("[DynaXarcabard]TE60_Trigger");
        if (bit.band(northTE, bit.lshift(1, (mobID - 17330827))) ~= 1) then
            SetServerVariable("[DynaXarcabard]TE60_Trigger",bit.bor(northTE, bit.lshift(1, (mobID - 17330827))))
        end
    -- 114: spawn 112 when defeated
    elseif (mobID == 17326790) then
        SpawnMob(17326086);
    -- 144-149: spawn 150 when defeated
    elseif (mobID >= 17330913 and mobID <= 17330918) then
        local wallTE = GetServerVariable("[DynaXarcabard]TE150_Trigger");
        if (bit.band(wallTE, bit.lshift(1, (mobID - 17330913))) ~= 1) then
            SetServerVariable("[DynaXarcabard]TE150_Trigger",bit.bor(wallTE, bit.lshift(1, (mobID - 17330913))))
        end
    end
    
    if (GetServerVariable("[DynaXarcabard]TE150_Trigger") == 63) then
        SpawnMob(17330919); -- 150
        SetServerVariable("[DynaXarcabard]TE150_Trigger", 0) -- don't want it to be able to spawn again!
    end
    if (GetServerVariable("[DynaXarcabard]TE60_Trigger") == 7) then
        SpawnMob(17330830); -- 60
        SetServerVariable("[DynaXarcabard]TE60_Trigger", 0)
    end
    if (GetServerVariable("[DynaXarcabard]TE43_Trigger") == 3) then
        SpawnMob(17330814); -- 43
        SetServerVariable("[DynaXarcabard]TE43_Trigger", 0)
    end
end;