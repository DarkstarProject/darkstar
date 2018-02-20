-----------------------------------
--
-- Zone: Pashhow_Marshlands (109)
--
-----------------------------------
package.loaded[ "scripts/zones/Pashhow_Marshlands/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Pashhow_Marshlands/TextIDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/chocobo_digging");
require("scripts/globals/conquest");
require("scripts/globals/missions");
require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/zone");

local itemMap =
{
    -- itemid, abundance, requirement
    { 846, 216, DIGREQ_NONE },
    { 17296, 210, DIGREQ_NONE },
    { 869, 198, DIGREQ_NONE },
    { 736, 72, DIGREQ_NONE },
    { 695, 102, DIGREQ_NONE },
    { 4448, 48, DIGREQ_NONE },
    { 775, 36, DIGREQ_NONE },
    { 749, 18, DIGREQ_NONE },
    { 703, 6, DIGREQ_NONE },
    { 885, 9, DIGREQ_NONE },
    { 4096, 100, DIGREQ_NONE },  -- all crystals
    { 2364, 120, DIGREQ_BURROW },
    { 2235, 42, DIGREQ_BURROW },
    { 1237, 24, DIGREQ_BURROW },
    { 1236, 12, DIGREQ_BURROW },
    { 4570, 10, DIGREQ_MODIFIER },
    { 4487, 11, DIGREQ_MODIFIER },
    { 4409, 12, DIGREQ_MODIFIER },
    { 1188, 10, DIGREQ_MODIFIER },
    { 4532, 12, DIGREQ_MODIFIER },
};

local messageArray = { DIG_THROW_AWAY, FIND_NOTHING, ITEM_OBTAINED };

function onChocoboDig(player, precheck)
    return chocoboDig(player, itemMap, precheck, messageArray);
end;

function onInitialize(zone)
    SetRegionalConquestOverseers(zone:getRegionID())
end;

function onZoneIn( player, prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( 547.841, 23.192, 696.323, 136);
    end

    if (prevZone == 147 and player:getCurrentMission(BASTOK) == THE_FOUR_MUSKETEERS) then
        missionStatus = player:getVar("MissionStatus");
        if (missionStatus > 0 and missionStatus < 22) then
            cs = 10;
        elseif (missionStatus == 22) then
            cs = 11;
        end
    elseif (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 13;
    elseif (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1) then
        cs = 15;
    end

    return cs;
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onRegionEnter( player, region)
end;

function onEventUpdate( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 13) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 15) then
        if (player:getXPos() <  362) then
            player:updateEvent(0,0,0,0,0,2);
        end
    end

end;

function onEventFinish( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 10) then
        player:setPos( 578, 25, -376, 126);
    elseif (csid == 11) then
        finishMissionTimeline( player, 1, csid, option);
        player:setPos( 578, 25, -376, 126);
    elseif (csid == 13) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;
