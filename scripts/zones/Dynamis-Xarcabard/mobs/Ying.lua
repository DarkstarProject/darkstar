-----------------------------------
-- Area: Dynamis Xarcabard
--  NM:  Ying
-----------------------------------

require("scripts/globals/status");

-----------------------------------
-- onMobInitialize Action
-----------------------------------

function onMobInitialize(mob,target)
end;

-----------------------------------
-- onMobFight Action
-----------------------------------

function onMobFight(mob,target)
    local YangID = 17330184;
    local YangToD = GetMobByID(YingID):getLocalVar("YangToD");
    -- Repop Yang every 30 seconds if Ying is up and Yang is not.
    if (mob:getBattleTime() > YangToD+30 and GetMobAction(YangID) == ACTION_NONE) then
        SpawnMob(YangID):updateEnmity(target);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    local YangID = 17330184;
    -- localVars clear on death, so setting it on its partner
    GetMobByID(YangID):setLocalVar("YingToD", os.time());

    -- This is not retail, this is not how you pop DynaLord:
    if (GetMobAction(17330177) == ACTION_NONE and GetMobAction(YangID) == ACTION_NONE) then
        -- GetMobByID(17330177):setLocalVar("timeLimit", os.time() + 1800); -- Time for the 30min limit
        SpawnMob(17330177); -- Dynamis Lord
    end
end;