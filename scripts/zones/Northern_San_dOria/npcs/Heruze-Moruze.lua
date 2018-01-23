-----------------------------------
-- Area: Northern San d'Oria
--  NPC: Heruze-Moruze
-- Involved in Mission: 2-3 Windurst
-- !pos -56 -3 36 231
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Northern_San_dOria/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
-----------------------------------

function onTrade(player,npc,trade)

    if (player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE) == QUEST_ACCEPTED) then
        if (trade:hasItemQty(532,1) and trade:getItemCount() == 1) then -- Trade Magicmart_flyer
            player:messageSpecial(FLYER_REFUSED);
        end
    end

end;

function onTrigger(player,npc)

    pNation = player:getNation();
    currentMission = player:getCurrentMission(pNation);

    if (pNation == NATION_WINDURST) then
        if (currentMission == THE_THREE_KINGDOMS and player:getVar("MissionStatus") == 1) then
            player:startEvent(582);
        else
            player:startEvent(554);
        end
    elseif (pNation == NATION_BASTOK) then
        player:startEvent(578);
    elseif (pNation == NATION_SANDORIA) then
        player:startEvent(577);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 582) then
        player:setVar("MissionStatus",2);
    end

end;