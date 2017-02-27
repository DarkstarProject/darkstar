-----------------------------------
--
-- Zone: Aht_Urhgan_Whitegate (50)
--
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/titles");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    zone:registerRegion(1,57,-1,-70,62,1,-65); -- Sets Mark for "Got It All" Quest cutscene.
    zone:registerRegion(2,-96,-7,121,-64,-5,137); -- Sets Mark for "Vanishing Act" Quest cutscene.
    zone:registerRegion(3,14,-7,-65,37,-2,-41); -- TOAU Mission 1 CS area
    zone:registerRegion(4,75,-3,25,90,1,59);
    zone:registerRegion(5,73,-7,-137,95,-3,-115);
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn(player,prevZone)
    local cs = -1;

    if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
        if (prevZone == 46) then
            cs = 0x00c9;
        elseif (prevZone == 59) then
            cs = 0x00cc;
        elseif (prevZone == 58) then
            cs = 0x00cc;
        else
            -- MOG HOUSE EXIT
            local position = math.random(1,5) - 83;
            player:setPos(-100,0,position,0);
        end
    end

    if (player:getCurrentMission(TOAU) == STIRRINGS_OF_WAR and player:getVar("AhtUrganStatus") == 0 and
            player:getVar("TOAUM38_STARTDAY") ~= VanadielDayOfTheYear() and player:needToZone() == false) then
        cs = 3220;
    end

    return cs;
end;

-----------------------------------
-- afterZoneIn
-----------------------------------

function afterZoneIn(player)
    player:entityVisualPacket("1pb1");
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
    switch (region:GetRegionID()): caseof
    {
        [1] = function (x)  -- Cutscene for Got It All quest.
            if (player:getVar("gotitallCS") == 5) then
                player:startEvent(526);
            end
        end,
        [2] = function (x) -- CS for Vanishing Act Quest
            if (player:getVar("vanishingactCS") == 3) then
                player:startEvent(44);
            end
        end,
        [3] = function (x) -- TOAU Mission 1
            if (player:getCurrentMission(TOAU)== LAND_OF_SACRED_SERPENTS) then
                player:startEvent(3000,0,0,0,0,0,0,0,0,0);
            elseif (player:getCurrentMission(TOAU) == A_MERCENARY_LIFE and player:needToZone() == false) then
                if (prevZone ~= 50) then
                    player:startEvent(3050,3,3,3,3,3,3,3,3,0);
                end
            elseif (player:getCurrentMission(TOAU) == FINDERS_KEEPERS) then
                player:startEvent(3093);
            elseif (player:getCurrentMission(TOAU) == SOCIAL_GRACES) then
                player:startEvent(3095)
            elseif (player:getCurrentMission(TOAU) == FOILED_AMBITION and player:getVar("TOAUM23_STARTDAY") ~= VanadielDayOfTheYear() and player:needToZone() == false) then
                player:startEvent(3097,0,0,0,0,0,0,0,0,0)
            elseif (player:getCurrentMission(TOAU) == PLAYING_THE_PART and player:getVar("TOAUM24_STARTDAY") ~= VanadielDayOfTheYear() and player:needToZone() == false) then
                player:startEvent(3110);
            elseif (player:getCurrentMission(TOAU) == PATH_OF_BLOOD) then
                player:startEvent(3131,1,1,1,1,1,1,1,1);
            end
        end,
        [4] = function (x) -- AH mission
            if (player:getCurrentMission(TOAU)== KNIGHT_OF_GOLD and player:getVar("AhtUrganStatus") == 2) then
                player:startEvent(3024,0,0,0,0,0,0,0,0,0);
            elseif (player:getCurrentMission(TOAU)== BASTION_OF_KNOWLEDGE) then
                player:startEvent(3112);
            end
        end,
        [5] = function (x) -- AH mission
            if (player:getCurrentMission(TOAU)== KNIGHT_OF_GOLD and player:getVar("AhtUrganStatus") == 3) then
                player:startEvent(3026,0,0,0,0,0,0,0,0,0);
            elseif (player:getCurrentMission(TOAU) == WESTERLY_WINDS and player:getVar("AhtUrganStatus") == 0) then
                player:startEvent(3027,0,0,0,0,0,0,0,0,0);
            elseif (player:getCurrentMission(TOAU) == SWEETS_FOR_THE_SOUL) then
                player:startEvent(3092);
            elseif (player:getCurrentMission(TOAU) == STIRRINGS_OF_WAR and player:getVar("AhtUrganStatus") == 1) then
                player:startEvent(3136,0,0,0,0,0,0,0,0,0);
            end
        end,
    }
end;

-----------------------------------
-- onRegionLeave
-----------------------------------

function onRegionLeave(player,region)
end;

-----------------------------------
-- onTransportEvent
-----------------------------------

function onTransportEvent(player,transport)
    if (transport == 46 or transport == 47) then
        player:startEvent(0x00c8);
    elseif (transport == 58 or transport == 59) then
        player:startEvent(0x00cb);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 3050 and option == 1) then
        if (player:getLocalVar("A_MERCENARY_LIFE") == 0) then
            player:setLocalVar("A_MERCENARY_LIFE", 1);
            player:updateEvent(1,0,0,0,0,0,0,0);
        else
            player:updateEvent(3,0,0,0,0,0,0,0);
        end
    elseif (csid == 3050 and option == 2) then
        if (player:getLocalVar("A_MERCENARY_LIFE") == 0) then
            player:setLocalVar("A_MERCENARY_LIFE", 1);
            player:updateEvent(2,0,0,0,0,0,0,0);
        else
            player:updateEvent(3,0,0,0,0,0,0,0);
        end
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 44) then
        player:setVar("vanishingactCS",4);
        player:setPos(-80,-6,122,5);
    elseif (csid == 200) then
        player:setPos(0,-2,0,0,47);
    elseif (csid == 201) then
        player:setPos(-11,2,-142,192);
    elseif (csid == 203) then
        player:setPos(0,-2,0,0,58);
    elseif (csid == 204) then
        player:setPos(11,2,142,64);
    elseif (csid == 526) then
        player:setVar("gotitallCS",6);
        player:setPos(60,0,-71,38);
    elseif (csid == 3000) then
        player:addKeyItem(SUPPLIES_PACKAGE);
        player:completeMission(TOAU,LAND_OF_SACRED_SERPENTS,player);
        player:addMission(TOAU,IMMORTAL_SENTRIES,player);
        player:messageSpecial(KEYITEM_OBTAINED,SUPPLIES_PACKAGE);
    elseif (csid == 3024) then
        player:setVar("AhtUrganStatus",3);
    elseif (csid == 3026) then
        player:setVar("AhtUrganStatus",0);
        player:addKeyItem(RAILLEFALS_LETTER);
        player:messageSpecial(KEYITEM_OBTAINED,RAILLEFALS_LETTER);
        player:completeMission(TOAU,KNIGHT_OF_GOLD);
        player:addMission(TOAU,CONFESSIONS_OF_ROYALTY);
    elseif (csid == 3027) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,2185);
        else
            player:setVar("AhtUrganStatus",1)
            player:addKeyItem(RAILLEFALS_NOTE);
            player:setTitle(483);
            player:addItem(2185,1);
            player:messageSpecial(KEYITEM_OBTAINED,RAILLEFALS_NOTE);
            player:messageSpecial(ITEM_OBTAINED,2185);
        end
    elseif (csid == 3050) then
        player:completeMission(TOAU,A_MERCENARY_LIFE);
        player:addMission(TOAU,UNDERSEA_SCOUTING);
    elseif (csid == 3092) then
        player:completeMission(TOAU,SWEETS_FOR_THE_SOUL);
        player:addMission(TOAU,TEAHOUSE_TUMULT);
    elseif (csid == 3093) then
        player:completeMission(TOAU,FINDERS_KEEPERS);
        player:setTitle(KARABABAS_BODYGUARD);
        player:addMission(TOAU,SHIELD_OF_DIPLOMACY);    
    elseif (csid == 3095) then
        player:completeMission(TOAU,SOCIAL_GRACES);
        player:needToZone(true);
        player:setVar("TOAUM23_STARTDAY", VanadielDayOfTheYear());
        player:addMission(TOAU,FOILED_AMBITION);
    elseif (csid == 3097) then
        player:completeMission(TOAU,FOILED_AMBITION);
        player:setTitle(KARABABAS_SECRET_AGENT);
        player:addItem(2187,5);
        player:setVar("TOAUM23_STARTDAY", 0);
        player:needToZone(true);
        player:setVar("TOAUM24_STARTDAY", VanadielDayOfTheYear());
        player:addMission(TOAU,PLAYING_THE_PART);
    elseif (csid == 3110) then
        player:completeMission(TOAU,PLAYING_THE_PART);
        player:setVar("TOAUM24_STARTDAY", 0);
        player:addMission(TOAU,SEAL_OF_THE_SERPENT);
    elseif (csid == 3112) then
        player:completeMission(TOAU,BASTION_OF_KNOWLEDGE);
        player:setTitle(APHMAUS_MERCENARY);
        player:addMission(TOAU,PUPPET_IN_PERIL);
    elseif (csid == 3131) then
        player:completeMission(TOAU,PATH_OF_BLOOD);
        player:needToZone(true);
        player:setVar("TOAUM38_STARTDAY", VanadielDayOfTheYear());
        player:addMission(TOAU,STIRRINGS_OF_WAR);
    elseif (csid == 3220) then
        player:setVar("TOAUM38_STARTDAY", 0);
        player:setVar("AhtUrganStatus", 1);
    elseif (csid == 3136) then
        player:completeMission(TOAU,STIRRINGS_OF_WAR);
        player:setVar("AhtUrganStatus", 0);
        player:addKeyItem(ALLIED_COUNCIL_SUMMONS);
        player:messageSpecial(KEYITEM_OBTAINED,ALLIED_COUNCIL_SUMMONS);
        player:addMission(TOAU,ALLIED_RUMBLINGS);
    end
end;
