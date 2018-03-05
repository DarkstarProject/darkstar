-----------------------------------
-- Area: Windurst Woods
--  NPC: Hae Jakkya
-- Working 100%
-----------------------------------
require("scripts/globals/settings");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    chasingStatus = player:getQuestStatus(WINDURST,CHASING_TALES);
    if (player:hasKeyItem(126) ==true) then
        player:startEvent(406);
    elseif (player:getVar("CHASING_TALES_TRACK_BOOK") == 1) then
        player:startEvent(403);

    elseif (player:hasKeyItem(149)) then
        player:startEvent(402); -- Neeed CS here

    else
        player:startEvent(41);
    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 402) then
        player:setVar("CHASING_TALES_TRACK_BOOK",1);
    end
end;
