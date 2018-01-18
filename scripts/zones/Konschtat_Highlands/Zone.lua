-----------------------------------
--
-- Zone: Konschtat_Highlands (108)
--
-----------------------------------
package.loaded["scripts/zones/Konschtat_Highlands/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Konschtat_Highlands/TextIDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/chocobo_digging");
require("scripts/globals/conquest");
require("scripts/globals/missions");

local itemMap =
{
    -- itemid, abundance, requirement
    { 847, 13, DIGREQ_NONE },
    { 880, 165, DIGREQ_NONE },
    { 690, 68, DIGREQ_NONE },
    { 864, 80, DIGREQ_NONE },
    { 768, 90, DIGREQ_NONE },
    { 869, 63, DIGREQ_NONE },
    { 749, 14, DIGREQ_NONE },
    { 17296, 214, DIGREQ_NONE },
    { 844, 14, DIGREQ_NONE },
    { 868, 45, DIGREQ_NONE },
    { 642, 71, DIGREQ_NONE },
    { 4096, 100, DIGREQ_NONE },  -- all crystals
    { 845, 28, DIGREQ_BORE },
    { 842, 27, DIGREQ_BORE },
    { 843, 23, DIGREQ_BORE },
    { 1845, 22, DIGREQ_BORE },
    { 838, 19, DIGREQ_BORE },
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
end;

function onZoneIn( player, prevZone)
    local cs = -1;

    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos( 521.922, 28.361, 747.85, 45);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 104;
    elseif (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1) then
        cs = 106;
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
    if (csid == 104) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 106) then
        if (player:getZPos() >  855) then
            player:updateEvent(0,0,0,0,0,2);
        elseif (player:getXPos() >  32 and player:getXPos() < 370) then
            player:updateEvent(0,0,0,0,0,1);
        end
    end
end;

function onEventFinish( player, csid, option)
    if (csid == 104) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    end
end;
