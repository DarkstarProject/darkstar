-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Ailevia
-- Adventurer's Assistant
-- Only recieving Adv.Coupon and simple talk event are scripted
-- This NPC participates in Quests and Missions
-- @zone 230
-- !pos -8 1 1
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    -- Adventurer coupon
    if (trade:getItemCount() == 1 and trade:hasItemQty(0x218,1) == true) then
        player:startEvent(655);
    end
    -- "Flyers for Regine" conditional script
    local count = trade:getItemCount();
    local MagicFlyer = trade:hasItemQty(532,1);

    if (MagicFlyer == true and count == 1) then
        local FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);
        if (FlyerForRegine == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
end;

function onTrigger(player,npc)
    player:startEvent(615); -- i know a thing or 2 about these streets
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 655) then
        player:addGil(GIL_RATE*50);
        player:tradeComplete();
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*50);
    end
end;
