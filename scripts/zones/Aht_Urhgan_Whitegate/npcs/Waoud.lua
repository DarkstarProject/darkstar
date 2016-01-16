-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC:  Waoud
-- Standard Info NPC
-- Involved in quest: An Empty Vessel
-- @pos 65 -6 -78 50
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    local StoneID = player:getVar("EmptyVesselStone");

    if (player:getVar("AnEmptyVesselProgress") == 3 and player:getQuestStatus(AHT_URHGAN,AN_EMPTY_VESSEL) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(StoneID,1) and trade:getGil() == 0 and trade:getItemCount() == 1) then
            player:startEvent(0x0043,StoneID); -- get the stone to Aydeewa
        end;
    end;
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local AnEmptyVessel = player:getQuestStatus(AHT_URHGAN,AN_EMPTY_VESSEL);
    local AnEmptyVesselProgress = player:getVar("AnEmptyVesselProgress");
    local divinationDay = player:getVar("LastDivinationDay");
    local currentDay = VanadielDayOfTheYear();
    local divinationReady = ((divinationDay < currentDay) or (divinationDay > currentDay and player:getVar("LastDivinationYear") < VanadielYear()));

    if (ENABLE_TOAU == 1 and player:getMainLvl() >= ADVANCED_JOB_LEVEL and AnEmptyVessel == QUEST_AVAILABLE and AnEmptyVesselProgress <= 1 and divinationReady == true) then
        player:startEvent(0x003c,player:getGil()); -- initial cutscene where you get what stone you are gonne give to him if you answer all 10 questions correctly
    elseif (AnEmptyVesselProgress == 1 and AnEmptyVessel == QUEST_AVAILABLE and divinationReady == false) then -- on the same day
        player:startEvent(0x003f); -- reminder to come back next day, cause you failed
    elseif (AnEmptyVesselProgress == 2 and AnEmptyVessel == QUEST_ACCEPTED) then
        if (player:needToZone() == false and divinationReady == true) then -- Have zoned and waited a day
            player:startEvent(0x0041); -- shortened version to which stone you need to get, after this you can trade the requested stone to him.
        else -- Have not zoned, or have not waited, or both.
            player:startEvent(0x0040); -- you have successed before but you still need to wait a gameday and zone
        end
    elseif (AnEmptyVesselProgress == 3) then
        player:startEvent(0x0042); -- reminder of the shortened version, you can trade the stone.
    elseif (AnEmptyVesselProgress == 4) then 
        player:startEvent(0x0044); -- reminder to get the stone to Aydeewa
    elseif (AnEmptyVessel == QUEST_COMPLETED and player:hasKeyItem(771) == true and player:getVar("BluAFBeginnings_Optional") == 0) then
        player:startEvent(0x0045); -- optional CS for AF
    else
        player:startEvent(0x003D);
    end;
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);

    local success = player:getVar("SuccessfullyAnswered"); -- number of questions answered successfully

    if (csid == 0x003c) then
        if (option == 2) then
            player:setVar("SuccessfullyAnswered",success+1);
        elseif (option == 6) then
            player:setVar("SuccessfullyAnswered",success+1);
        elseif (option == 7 or option == 9) then
            player:setVar("SuccessfullyAnswered",success+1);
        elseif (option == 12) then
            player:setVar("SuccessfullyAnswered",success+1);
        elseif (option == 13) then
            player:setVar("SuccessfullyAnswered",success+1);
        elseif (option == 18) then
            player:setVar("SuccessfullyAnswered",success+1);
        elseif (option == 21) then
            player:setVar("SuccessfullyAnswered",success+1);
        elseif (option == 24) then
            player:setVar("SuccessfullyAnswered",success+1);
        elseif (option == 26) then
            player:setVar("SuccessfullyAnswered",success+1);
        elseif (option == 30) then
            player:setVar("SuccessfullyAnswered",success+1);
        elseif (success == 10) then
            local rand = math.random(1,3); -- which stone you will need to get.
            player:setVar("StoneYouNeed",rand);
            player:updateEvent(player:getGil(),0,0,0,0,0,rand,70); -- all 5 serpents / success!
            switch (rand): caseof -- 1 == Siren's Tear (576), 2 == Valkurm Sunsand(503), 3 == Dangurf Stone(553)
            {
                [1] = function (x) player:setVar("EmptyVesselStone",576) end, -- Siren's Tear
                [2] = function (x) player:setVar("EmptyVesselStone",503) end, -- Valkurm Sunsand
                [3] = function (x) player:setVar("EmptyVesselStone",553) end -- Dangruf Stone
            }
        elseif (success < 10 and success >=8) then
            player:updateEvent(player:getGil(),0,0,0,0,0,0,60); -- Skyserpent
        elseif (success < 8 and success >=6) then
            player:updateEvent(player:getGil(),0,0,0,0,0,0,40); -- Flameserpent
        elseif (success < 6 and success >=4) then
            player:updateEvent(player:getGil(),0,0,0,0,0,0,30); -- Galeserpent
        elseif (success < 4 and success >=2) then
            player:updateEvent(player:getGil(),0,0,0,0,0,0,20); -- Stoneserpent
        elseif (success < 2 and success >=0 ) then
            player:updateEvent(player:getGil(),0,0,0,0,0,0,10); -- Springserpent
        end;
    elseif (csid == 0x0041 and option == 2) then
        player:setVar("AnEmptyVesselProgress",3);
    end;
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);

    if (csid == 0x003c and option == 50) then -- Begin BLU quest
        player:needToZone(true);
        player:setVar("LastDivinationDay",VanadielDayOfTheYear());
        player:setVar("LastDivinationYear",VanadielYear());
        player:setVar("AnEmptyVesselProgress",2);
        player:setVar("SuccessfullyAnswered",0);
        player:addQuest(AHT_URHGAN,AN_EMPTY_VESSEL);
    elseif (csid == 0x0041 and option == 1) then -- Continue BLU quest
        player:setVar("AnEmptyVesselProgress",3);
        player:setVar("LastDivinationDay",0);
        player:setVar("LastDivinationYear",0);
    elseif (csid == 0x0043) then -- Turn in stone, go to Aydeewa
        player:setVar("AnEmptyVesselProgress",4);
    elseif (csid == 0x0045 and option == 1) then -- Optional (?) cutscene for AF quest.
        player:setVar("BluAFBeginnings_Waoud",1);
    elseif (csid ==0x003c and option ~= 50 and option ~= 0) then
        player:setVar("LastDivinationDay",VanadielDayOfTheYear());
        player:setVar("LastDivinationYear",VanadielYear());
        player:setVar("AnEmptyVesselProgress",1);
        player:setVar("SuccessfullyAnswered",0);
        player:delGil(1000);
        player:messageSpecial(8633); -- "You pay 1000 gil for the divination."
    end;
end;