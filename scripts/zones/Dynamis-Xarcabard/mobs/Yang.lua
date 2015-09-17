-----------------------------------
-- Area: Dynamis Xarcabard
--  NM:  Yang
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
    local YingID = 17330183;
    local YingToD = mob:getLocalVar("YingToD");
    -- Repop Ying every 30 seconds if Yang is up and Ying is not.
    if (mob:getBattleTime() > YingToD+30 and GetMobAction(YingID) == ACTION_NONE) then
        SpawnMob(YingID):updateEnmity(target);
    end
end;

-----------------------------------
-- onMobDeath
-----------------------------------

function onMobDeath(mob,killer)
    local YingID = 17330183;
    -- localVars clear on death, so setting it on its partner
    GetMobByID(YingID):setLocalVar("YangToD", os.time());

    -- This is not retail, this is not how you pop DynaLord:
    if (GetMobAction(17330177) == ACTION_NONE and GetMobAction(YingID) == ACTION_NONE) then
        -- GetMobByID(17330177):setLocalVar("timeLimit", os.time() + 1800); -- Time for the 30min limit
        SpawnMob(17330177); -- Dynamis Lord
    end
end;