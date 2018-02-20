-----------------------------------
--
-- Zone: Qufim_Island (126)
--
-----------------------------------
package.loaded["scripts/zones/Qufim_Island/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/zone");
require("scripts/globals/conquest");
require("scripts/zones/Qufim_Island/TextIDs");
-----------------------------------

function onInitialize(zone)
    SetRegionalConquestOverseers(zone:getRegionID())
end;

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();

    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
end;

function onZoneIn(player,prevZone)
    local cs = -1;
    if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
        player:setPos(-286.271,-21.619,320.084,255);
    end
    if (prevZone == 127 and player:getVar("theTalekeepersGiftKilledNM") >= 3) then
        cs = 100;
    end
    return cs;
end;

function onRegionEnter(player,region)
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 100) then
        if (player:getFreeSlotsCount() == 0) then
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,12638); -- Fighter's Lorica
        else
            player:addTitle(PARAGON_OF_WARRIOR_EXCELLENCE);
            player:addItem(12638);
            player:messageSpecial(ITEM_OBTAINED, 12638); -- Fighter's Lorica
            player:setVar("theTalekeeperGiftCS",0);
            player:setVar("theTalekeepersGiftKilledNM",0);
            player:addFame(BASTOK,AF3_FAME);
            player:completeQuest(BASTOK,THE_TALEKEEPER_S_GIFT);
        end
    end
end;
