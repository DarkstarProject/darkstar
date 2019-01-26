-----------------------------------
--
-- Zone: East_Sarutabaruta (116)
--
-----------------------------------
local ID = require("scripts/zones/East_Sarutabaruta/IDs")
require("scripts/globals/icanheararainbow");
require("scripts/globals/chocobo_digging");
require("scripts/globals/conquest");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/globals/zone");
-----------------------------------

function onChocoboDig(player, precheck)
    return dsp.chocoboDig.start(player, precheck)
end;

function onInitialize(zone)
    UpdateNMSpawnPoint(ID.mob.DUKE_DECAPOD);
    GetMobByID(ID.mob.DUKE_DECAPOD):setRespawnTime(math.random(3600, 4200));
end;

function onZoneIn( player, prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(305.377,-36.092,660.435,71);
    end

    -- Check if we are on Windurst Mission 1-2
    if (player:getCurrentMission(WINDURST) == THE_HEART_OF_THE_MATTER and player:getVar( "MissionStatus") == 5 and prevZone == dsp.zone.OUTER_HORUTOTO_RUINS) then
        cs = 48;
    elseif (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 50;
    elseif (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1) then
        cs = 52; -- go north no parameters (0 = north NE 1 E 2 SE 3 S 4 SW 5 W6 NW 7 @ as the 6th parameter)
    elseif (player:getCurrentMission(ASA) == BURGEONING_DREAD and prevZone == dsp.zone.WINDURST_WOODS and
        player:hasStatusEffect(dsp.effect.MOUNTED) == false ) then
        cs = 71;
    end

    return cs;
end;

function onConquestUpdate(zone, updatetype)
    dsp.conq.onConquestUpdate(zone, updatetype)
end;

function onRegionEnter( player, region)
end;

function onEventUpdate( player, csid, option)
    if (csid == 50) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 52) then
        if (player:getPreviousZone() == dsp.zone.WINDURST_WOODS or player:getPreviousZone() == dsp.zone.WEST_SARUTABARUTA) then
            if (player:getZPos() < 570) then
                player:updateEvent(0,0,0,0,0,1);
            else
                player:updateEvent(0,0,0,0,0,2);
            end
        elseif (player:getPreviousZone() == dsp.zone.OUTER_HORUTOTO_RUINS) then
            if (player:getZPos() > 570) then
                player:updateEvent(0,0,0,0,0,2);
            end
        end
    elseif (csid == 71) then
        player:setVar("ASA_Status",option);
    end
end;

function onEventFinish( player, csid, option)
    if (csid == 48) then
        player:setVar( "MissionStatus",6);
        -- Remove the glowing orb key items
        player:delKeyItem(dsp.ki.FIRST_GLOWING_MANA_ORB);
        player:delKeyItem(dsp.ki.SECOND_GLOWING_MANA_ORB);
        player:delKeyItem(dsp.ki.THIRD_GLOWING_MANA_ORB);
        player:delKeyItem(dsp.ki.FOURTH_GLOWING_MANA_ORB);
        player:delKeyItem(dsp.ki.FIFTH_GLOWING_MANA_ORB);
        player:delKeyItem(dsp.ki.SIXTH_GLOWING_MANA_ORB);
    elseif (csid == 50) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 71) then
        player:completeMission(ASA,BURGEONING_DREAD);
        player:addMission(ASA,THAT_WHICH_CURDLES_BLOOD);
    end
end;
