-----------------------------------
-- Area: Norg
--  NPC: Oaken door (Gilgamesh's room)
-- !pos 97 -7 -12 252
-----------------------------------
require("scripts/globals/missions");
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local ZilartMission = player:getCurrentMission(ZILART);
    local currentMission = player:getCurrentMission(BASTOK);
   local ZilartStatus = player:getVar("ZilartStatus");

   -- Checked here to be fair to new players
   local DMEarrings = 0;
   for i=14739, 14743 do
      if (player:hasItem(i)) then
         DMEarrings = DMEarrings + 1;
      end
    end

    if (ZilartMission == WELCOME_TNORG) then
        player:startEvent(2); -- Zilart Missions 2
    elseif (ZilartMission == ROMAEVE and player:getVar("ZilartStatus") <= 1) then
        player:startEvent(3); -- Zilart Missions 9
    elseif (ZilartMission == THE_HALL_OF_THE_GODS) then
        player:startEvent(169); -- Zilart Missions 11
    elseif (currentMission == THE_PIRATE_S_COVE and player:getVar("MissionStatus") == 1) then
        player:startEvent(98); -- Bastok Mission 6-2
    elseif (ZilartMission == THE_SEALED_SHRINE and ZilartStatus == 0 and DMEarrings <= NUMBER_OF_DM_EARRINGS) then
        player:startEvent(172);
    else
        player:startEvent(5);
    end

    return 1;

end;

-- 0x00af  5  2  3  169  172  0x00ce  0x00eb
-- 0x00af  0x0000  2  3  0x0004  0x0007  0x0008  0x0009  0x000a  98  0x0063  0x001d  0x000c  0x000d
-- 0x0092  0x009e  0x00a4  169  0x00aa  0x00ab  172  0x00ad  0x00b0  0x00b1  0x00e8  0x00e9  0x00ea

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
printf("CSID: %u",csid);
printf("RESULT: %u",option);

    if (csid == 2 and option == 0) then
        player:completeMission(ZILART,WELCOME_TNORG);
        player:addMission(ZILART,KAZAMS_CHIEFTAINESS);
    elseif (csid == 3 and option == 0) then
        player:setVar("ZilartStatus",0);
        player:completeMission(ZILART,ROMAEVE);
        player:addMission(ZILART,THE_TEMPLE_OF_DESOLATION);
    elseif (csid == 169 and option == 0) then
        player:completeMission(ZILART,THE_HALL_OF_THE_GODS);
        player:addMission(ZILART,THE_MITHRA_AND_THE_CRYSTAL);
    elseif (csid == 98) then
        player:setVar("MissionStatus",2);
    elseif (csid == 172 and bit.band(option, 0x40000000) == 0) then
        player:setVar("ZilartStatus",1);
    end

end;