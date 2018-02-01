-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Celyddon
--  General Info NPC
-- @zone 230
-- !pos -129 -6 90
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

    ASquiresTest = player:getQuestStatus(SANDORIA,A_SQUIRE_S_TEST)

    if ASquiresTest == (QUEST_AVAILABLE) then
        player:startEvent(618); -- im looking for the examiner
    elseif ASquiresTest == (QUEST_ACCEPTED) then
        player:startEvent(619) -- i found the examiner but said i had to use sword
    else
        player:startEvent(620) -- says i needs a revival tree root
    end
end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
