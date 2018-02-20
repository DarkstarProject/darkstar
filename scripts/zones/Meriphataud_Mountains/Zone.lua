-----------------------------------
--
-- Zone: Meriphataud_Mountains (119)
--
-----------------------------------
package.loaded["scripts/zones/Meriphataud_Mountains/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Meriphataud_Mountains/TextIDs");
require("scripts/zones/Meriphataud_Mountains/MobIDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/chocobo_digging");
require("scripts/globals/conquest");
require("scripts/globals/missions");
require("scripts/globals/zone");
-----------------------------------

local itemMap =
{
    -- itemid, abundance, requirement
                    { 646, 4, DIGREQ_NONE },
                    { 845, 12, DIGREQ_NONE },
                    { 640, 112, DIGREQ_NONE },
                    { 768, 237, DIGREQ_NONE },
                    { 893, 41, DIGREQ_NONE },
                    { 748, 33, DIGREQ_NONE },
                    { 846, 145, DIGREQ_NONE },
                    { 869, 100, DIGREQ_NONE },
                    { 17296, 162, DIGREQ_NONE },
                    { 771, 21, DIGREQ_NONE },
                    { 4096, 100, DIGREQ_NONE },  -- all crystals
                    { 678, 5, DIGREQ_BURROW },
                    { 645, 9, DIGREQ_BURROW },
                    { 737, 5, DIGREQ_BURROW },
                    { 643, 69, DIGREQ_BURROW },
                    { 1650, 62, DIGREQ_BURROW },
                    { 644, 31, DIGREQ_BURROW },
                    { 736, 62, DIGREQ_BURROW },
                    { 739, 5, DIGREQ_BURROW },
                    { 678, 5, DIGREQ_BORE },
                    { 645, 9, DIGREQ_BORE },
                    { 737, 5, DIGREQ_BORE },
                    { 738, 8, DIGREQ_BORE },
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
    UpdateNMSpawnPoint(WARAXE_BEAK);
    GetMobByID(WARAXE_BEAK):setRespawnTime(math.random(900, 10800));

    UpdateNMSpawnPoint(COO_KEJA_THE_UNSEEN);
    GetMobByID(COO_KEJA_THE_UNSEEN):setRespawnTime(math.random(900, 10800));

    SetRegionalConquestOverseers(zone:getRegionID())
end;

function onZoneIn( player, prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( 752.632, -33.761, -40.035, 129);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 31;
    elseif (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1) then
        cs = 34; -- no update for castle oztroja (north)
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
    if (csid == 31) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 34) then
        if (player:getPreviousZone() == 120) then
            player:updateEvent(0,0,0,0,0,2);
        elseif (player:getPreviousZone() == 117) then
            player:updateEvent(0,0,0,0,0,1);
        end
    end
end;

function onEventFinish( player, csid, option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 31) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;