-----------------------------------
-- Area: Carpenters' Landing
--  NPC: ??? (qm2)
--  Involved in Missions: Calm Before the Storm (CoP 7-4)
-- !pos 120.615 -5.457 -390.133 2
-----------------------------------
package.loaded["scripts/zones/Carpenters_Landing/TextIDs"] = nil;
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    if (player:getCurrentMission(COP) == CALM_BEFORE_THE_STORM ) then

    local ExecutorID = 16785710;
    local Assassin1ID = ExecutorID+1;
    local Assassin2ID = ExecutorID+2;
    local Assassin3ID = ExecutorID+3;
    local ExecutorA = GetMobAction(ExecutorID);  --Cryptonberry_Executor
    local Assassin1A = GetMobAction(Assassin1ID);  --Cryptonberry_Assassins-1
    local Assassin2A = GetMobAction(Assassin2ID);  --Cryptonberry_Assassins-2
    local Assassin3A = GetMobAction(Assassin3ID);  --Cryptonberry_Assassins-3
    local Assassin1kill= player:getVar("Cryptonberry_Assassins-1_KILL");
    local Assassin2kill= player:getVar("Cryptonberry_Assassins-2_KILL");
    local Assassin3kill= player:getVar("Cryptonberry_Assassins-3_KILL");
    local Executorkill = player:getVar("Cryptonberry_Executor_KILL");

        -- printf("Assassin1: %u",Assassin1kill);
     -- printf("Assassin2: %u",Assassin2kill);
     -- printf("Assassin3: %u",Assassin3kill);
     -- printf("Executor: %u",Executorkill);

    if (Executorkill == 1 and Assassin1kill == 1 and Assassin2kill == 1 and Assassin3kill == 1) then -- If all Mobs have been killed
        player:startEvent(37);
    elseif (ExecutorA == 0 and Assassin1A == 0 and Assassin2A == 0 and Assassin3A == 0 and Executorkill~=2) then -- If no mobs present
        SpawnMob(ExecutorID):updateClaim(player);
        SpawnMob(Assassin1ID);
        SpawnMob(Assassin2ID);
        SpawnMob(Assassin3ID);
    else
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
    end
  end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 37) then
        player:setVar("Cryptonberry_Executor_KILL",2);
        player:setVar("Cryptonberry_Assassins-1_KILL",0);
        player:setVar("Cryptonberry_Assassins-2_KILL",0);
        player:setVar("Cryptonberry_Assassins-3_KILL",0);
    end
end;

