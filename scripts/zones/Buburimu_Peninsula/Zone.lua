-----------------------------------
--
-- Zone: Buburimu_Peninsula (118)
--
-----------------------------------
package.loaded[ "scripts/zones/Buburimu_Peninsula/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Buburimu_Peninsula/TextIDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/chocobo_digging");
require("scripts/globals/conquest");
require("scripts/globals/zone");
-----------------------------------

local itemMap =
{
    -- itemid, abundance, requirement
                    { 847, 45, DIGREQ_NONE },
                    { 887, 1, DIGREQ_NONE },
                    { 893, 53, DIGREQ_NONE },
                    { 17395, 98, DIGREQ_NONE },
                    { 738, 3, DIGREQ_NONE },
                    { 888, 195, DIGREQ_NONE },
                    { 4484, 47, DIGREQ_NONE },
                    { 17397, 66, DIGREQ_NONE },
                    { 641, 134, DIGREQ_NONE },
                    { 885, 12, DIGREQ_NONE },
                    { 4096, 100, DIGREQ_NONE },  -- all crystals
                    { 845, 125, DIGREQ_BURROW },
                    { 843, 1, DIGREQ_BURROW },
                    { 844, 64, DIGREQ_BURROW },
                    { 1845, 34, DIGREQ_BURROW },
                    { 838, 7, DIGREQ_BURROW },
                    { 880, 34, DIGREQ_BORE },
                    { 902, 5, DIGREQ_BORE },
                    { 886, 3, DIGREQ_BORE },
                    { 867, 3, DIGREQ_BORE },
                    { 864, 21, DIGREQ_BORE },
                    { 1587, 19, DIGREQ_BORE },
                    { 1586, 9, DIGREQ_BORE },
                    { 866, 2, DIGREQ_BORE },
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
        player:setPos( -276.529, 16.403, -324.519, 14);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 3;
    elseif (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1) then
        cs = 5; -- zone 4 buburimu no update (north)
    end

    return cs;
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onRegionEnter(player,region)
end;

function onEventUpdate( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 3) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 5) then
        if (player:getPreviousZone() == 213 or player:getPreviousZone() == 249) then
            player:updateEvent(0,0,0,0,0,7);
        elseif (player:getPreviousZone() == 198) then
            player:updateEvent(0,0,0,0,0,6);
        end
    end
end;

function onEventFinish( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 3) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;