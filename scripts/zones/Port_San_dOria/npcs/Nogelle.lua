-----------------------------------
-- Area: Port San d'Oria
-- NPC: Nogelle
-- Starts Lufet's Lake Salt
-----------------------------------
package.loaded["scripts/zones/Port_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/quests");
require("scripts/globals/titles");
require("scripts/zones/Port_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
-- "Flyers for Regine" conditional script
FlyerForRegine = player:getQuestStatus(SANDORIA,FLYERS_FOR_REGINE);

    if (FlyerForRegine == 1) then
        count = trade:getItemCount();
        MagicFlyer = trade:hasItemQty(532,1);
        if (MagicFlyer == true and count == 1) then
            player:messageSpecial(FLYER_REFUSED);
        end
    end
    
    if (player:getQuestStatus(SANDORIA,LUFET_S_LAKE_SALT) == QUEST_ACCEPTED) then
        count = trade:getItemCount();
        LufetSalt = trade:hasItemQty(1019,3);
        if (LufetSalt == true and count == 3) then
            player:tradeComplete();
            player:addFame(SANDORIA,30);
            player:addGil(GIL_RATE*600);
            player:addTitle(BEAN_CUISINE_SALTER);
            player:completeQuest(SANDORIA,LUFET_S_LAKE_SALT);
            player:startEvent(0x000b);
        end
    end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

LufetsLakeSalt = player:getQuestStatus(SANDORIA,LUFET_S_LAKE_SALT);

    if (LufetsLakeSalt == 0) then
        player:startEvent(0x000c);
    elseif (LufetsLakeSalt == 1) then
        player:startEvent(0x000a);
    elseif (LufetsLakeSalt == 2) then
        player:startEvent(0x020a);
    end

end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 0x000c and option == 1) then
        player:addQuest(SANDORIA,LUFET_S_LAKE_SALT);
    elseif (csid == 0x000b) then
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*600);
    end
end;




