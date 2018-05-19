-----------------------------------
--
-- Zone: West_Sarutabaruta (115)
--
-----------------------------------
package.loaded[ "scripts/zones/West_Sarutabaruta/TextIDs"] = nil;
-----------------------------------
require( "scripts/zones/West_Sarutabaruta/TextIDs");
require( "scripts/globals/icanheararainbow");
require("scripts/globals/chocobo_digging");
require("scripts/globals/conquest");
require("scripts/globals/zone");
-----------------------------------

local itemMap =
{
    -- itemid, abundance, requirement
                    { 689, 132, DIGREQ_NONE },
                    { 938, 79, DIGREQ_NONE },
                    { 17296, 132, DIGREQ_NONE },
                    { 847, 100, DIGREQ_NONE },
                    { 846, 53, DIGREQ_NONE },
                    { 833, 100, DIGREQ_NONE },
                    { 841, 53, DIGREQ_NONE },
                    { 834, 26, DIGREQ_NONE },
                    { 772, 50, DIGREQ_NONE },
                    { 701, 50, DIGREQ_NONE },
                    { 702, 3, DIGREQ_NONE },
                    { 4096, 100, DIGREQ_NONE },  -- all crystals
                    { 617, 50, DIGREQ_BORE },
                    { 4570, 10, DIGREQ_MODIFIER },
                    { 4487, 11, DIGREQ_MODIFIER },
                    { 4409, 12, DIGREQ_MODIFIER },
                    { 1188, 10, DIGREQ_MODIFIER },
                    { 4532, 12, DIGREQ_MODIFIER },
                    { 1237, 10, DIGREQ_NIGHT },
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
        player:setPos( -374.008, -23.712, 63.289, 213);
    end

    if (triggerLightCutscene(player)) then -- Quest: I Can Hear A Rainbow
        cs = 48;
    elseif (player:getCurrentMission(ASA) == BURGEONING_DREAD and prevZone == 238 ) then
        cs = 62;
    elseif (player:getCurrentMission(ASA) == BURGEONING_DREAD and prevZone == 240 ) then
        cs = 63;
    elseif (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1) then
        cs = 50;
    -- removed only "cs =" works onzonein and can't take parameters atm
    -- elseif (player:getCurrentMission(WINDURST) == VAIN and player:getVar("MissionStatus") ==1) then
        -- player:startEvent(50,0,0,0,0,0,2); -- talking doll go east
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
    if (csid == 48) then
        lightCutsceneUpdate(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 62 or csid == 63) then
        player:setVar("ASA_Status",option);
    elseif (csid == 50) then
        if (player:getZPos() > 470) then
            player:updateEvent(0,0,0,0,0,2);
        else
            player:updateEvent(0,0,0,0,0,1);
        end
    end
end;

function onEventFinish( player, csid, option)
    if (csid == 48) then
        lightCutsceneFinish(player); -- Quest: I Can Hear A Rainbow
    elseif (csid == 62 or csid == 63) then
        player:completeMission(ASA,BURGEONING_DREAD);
        player:addMission(ASA,THAT_WHICH_CURDLES_BLOOD);
    end
end;