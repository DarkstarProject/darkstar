-----------------------------------
--
-- Zone: Lower_Jeuno (245)
--
-----------------------------------
package.loaded["scripts/zones/Lower_Jeuno/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Lower_Jeuno/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/missions");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)

    zone:registerRegion(1, 23, 0, -43, 44, 7, -39); -- Inside Tenshodo HQ

end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;
    local month = tonumber(os.date("%m"));
    local day = tonumber(os.date("%d"));
    -- Retail start/end dates vary, I am going with Dec 5th through Jan 5th.
    if ((month == 12 and day >= 5) or (month == 1 and day <= 5)) then
        player:ChangeMusic(0,239);
        player:ChangeMusic(1,239);
        -- No need for an 'else' to change it back outside these dates as a re-zone will handle that.
    end

    -- MOG HOUSE EXIT
    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        player:setPos(41.2,-5, 84,85);
        if (player:getMainJob() ~= player:getVar("PlayerMainJob")) then
            cs = 0x7534;
        end
        player:setVar("PlayerMainJob",0);
    elseif (player:getCurrentMission(COP) == TENDING_AGED_WOUNDS and player:getVar("PromathiaStatus")==0) then
        player:setVar("PromathiaStatus",1);
        cs = 0x0046;
    elseif (ENABLE_ACP == 1 and player:getCurrentMission(ACP) == A_CRYSTALLINE_PROPHECY and player:getMainLvl() >=10) then
        cs = 0x276E;
    end

    return cs;
end;
-----------------------------------
-- onConquestUpdate
-----------------------------------

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
    -- print("entered region")
    if (region:GetRegionID() == 1) then
        -- print("entered region 1")
        if (player:getCurrentMission(ZILART) == AWAKENING and player:getVar("ZilartStatus") < 2) then
            player:startEvent(0x0014);
        end
    end
end;

-----------------------------------
-- onGameHour
-----------------------------------

function onGameHour()
    local VanadielHour = VanadielHour();

    -- Community Service Quest
    if (VanadielHour == 1) then
        if (GetServerVariable("[JEUNO]CommService") == 0) then
            GetNPCByID(17780880):setStatus(0); -- Vhana Ehgaklywha
            GetNPCByID(17780880):initNpcAi();
        end;

    elseif (VanadielHour == 5) then
        SetServerVariable("[JEUNO]CommService",0);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x7534 and option == 0) then
        player:setHomePoint();
        player:messageSpecial(HOMEPOINT_SET);
    elseif (csid == 0x0014) then
        player:setVar("ZilartStatus", player:getVar("ZilartStatus")+2);
    elseif (csid == 0x276E) then
        player:completeMission(ACP,A_CRYSTALLINE_PROPHECY);
        player:addMission(ACP,THE_ECHO_AWAKENS);
    end
end;