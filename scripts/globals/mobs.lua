-----------------------------------
-- Global version of onMobDeath
-----------------------------------
package.loaded["scripts/globals/conquest"] = nil;
-----------------------------------
require("scripts/globals/conquest");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/globals/status");
-----------------------------------

function onMobDeathEx(mob, player, isKiller, isWeaponSkillKill)
    -- Things that happen only to the person who landed killing blow
    if (isKiller == true) then
        -- DRK quest - Blade Of Darkness
        local BladeofDarkness = player:getQuestStatus(BASTOK, BLADE_OF_DARKNESS);
        local BladeofDeath = player:getQuestStatus(BASTOK, BLADE_OF_DEATH);
        local ChaosbringerKills = player:getVar("ChaosbringerKills");
        if (BladeofDarkness == QUEST_ACCEPTED or BladeofDeath == QUEST_ACCEPTED) then
            if (player:getEquipID(dsp.slot.MAIN) == 16607 and isWeaponSkillKill == false) then
                if (ChaosbringerKills < 200) then
                    player:setVar("ChaosbringerKills", ChaosbringerKills + 1);
                end
            end
        end
    end

    -- Things that happen to any player in the party/alliance
    if (player:getCurrentMission(WINDURST) == A_TESTING_TIME) then
        if (player:hasCompletedMission(WINDURST,A_TESTING_TIME) and player:getZoneID() == 118) then
            player:setVar("testingTime_crea_count",player:getVar("testingTime_crea_count") + 1);
        elseif (player:hasCompletedMission(WINDURST,A_TESTING_TIME) == false and player:getZoneID() == 117) then
            player:setVar("testingTime_crea_count",player:getVar("testingTime_crea_count") + 1);
        end
    end
end

-- is a lottery NM already spawned or primed to pop?
function lotteryPrimed(phList)
    local nm;
    for k,v in pairs(phList) do
        nm = GetMobByID(v);
        if (nm ~= nil and (nm:isSpawned() or nm:getRespawnTime() ~= 0)) then
            return true;
        end
    end
    return false;
end

-- potential lottery placeholder was killed
function phOnDespawn(ph,phList,chance,cooldown,immediate)
    if (type(immediate) ~= "boolean") then immediate = false; end

    local phId = ph:getID();
    local nmId = phList[phId];
    if (nmId ~= nil) then
        local nm = GetMobByID(nmId);
        if (nm ~= nil) then
            local pop = nm:getLocalVar("pop");
            if (os.time() > pop and not lotteryPrimed(phList) and math.random(100) <= chance) then

                -- on PH death, replace PH repop with NM repop
                -- print(string.format("ph %i winner! nm %i will pop in place",phId,nmId));
                DisallowRespawn(phId, true);
                DisallowRespawn(nmId, false);
                UpdateNMSpawnPoint(nmId);
                nm:setRespawnTime(immediate and 1 or GetMobRespawnTime(phId)); -- if immediate is true, spawn the nm immediately (1ms) else use placeholder's timer

                nm:addListener("DESPAWN", "DESPAWN_"..nmId, function(m)
                    -- on NM death, replace NM repop with PH repop
                    -- print(string.format("nm %i died. ph %i will pop in place",nmId,phId));
                    DisallowRespawn(nmId, true);
                    DisallowRespawn(phId, false);
                    GetMobByID(phId):setRespawnTime(GetMobRespawnTime(phId));
                    m:setLocalVar("pop", os.time() + cooldown);
                    m:removeListener("DESPAWN_"..nmId);
                end);

                return true;
            end
        end
    end

    return false;
end
