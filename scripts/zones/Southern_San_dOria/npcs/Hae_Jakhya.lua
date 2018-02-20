-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Hae Jakhya
--  General Info NPC
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Southern_San_dOria/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/quests");
-----------------------------------

function onTrade(player,npc,trade)
    -- "Flyers for Regine" conditional script
    local FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        local count = trade:getItemCount();
        local MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
end;

function onTrigger(player,npc)

    chasingStatus = player:getQuestStatus(WINDURST,CHASING_TALES);

    if (player:getVar("CHASING_TALES_TRACK_BOOK") == 1 and player:hasKeyItem(126) == false) then
        player:startEvent(611); -- Neeed CS here
    elseif (player:hasKeyItem(126) == true) then
        player:startEvent(612,0,126);
    else
        player:startEvent(610);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 611) then
        player:addKeyItem(126);
    player:messageSpecial(KEYITEM_OBTAINED,126);
    end
end;
