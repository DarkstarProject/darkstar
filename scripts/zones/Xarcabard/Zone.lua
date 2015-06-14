-----------------------------------
--
-- Zone: Xarcabard (112)
--
-----------------------------------
package.loaded[ "scripts/zones/Xarcabard/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Xarcabard/TextIDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/keyitems");
require("scripts/globals/zone");
require("scripts/globals/conquest");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    local manuals = {17236346,17236347};

    SetFieldManual(manuals);

    SetRegionalConquestOverseers(zone:getRegionID())
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn( player, prevZone)
    local cs = -1;

    local UnbridledPassionCS = player:getVar("unbridledPassion");

    if(prevZone == 135) then -- warp player to a correct position after dynamis
        player:setPos(569.312,-0.098,-270.158,90);
    end

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( -136.287, -23.268, 137.302, 91);
    end

    if (player:hasKeyItem( VIAL_OF_SHROUDED_SAND) == false and player:getRank() >= 6 and player:getMainLvl() >= 65 and player:getVar( "Dynamis_Status") == 0) then
        player:setVar( "Dynamis_Status", 1);
        cs = 0x000D;
    elseif (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 0x0009;
    elseif(UnbridledPassionCS == 3) then
        cs = 0x0004;
    elseif(player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1)then
        cs = 0x000b; 
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

function onRegionEnter( player, region)
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0009) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 0x000b)then
        if(player:getPreviousZone() == 111)then
            player:updateEvent(0,0,0,0,0,2);
        else
            player:updateEvent(0,0,0,0,0,3);
        end
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x0009) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    elseif(csid == 0x0004) then
        player:setVar("unbridledPassion",4);
    end
end;