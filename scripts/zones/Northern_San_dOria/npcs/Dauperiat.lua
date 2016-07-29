-----------------------------------
-- Area: Northern San d'Oria
-- NPC:  Dauperiat
-- Starts and Finishes Quest: Blackmail (R)
-- @zone 231
-- @pos 
-----------------------------------
package.loaded["scripts/zones/Northern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Northern_San_dOria/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

    Black = player:getQuestStatus(SANDORIA,BLACKMAIL);
    questState = player:getVar("BlackMailQuest");

    if (Black == QUEST_ACCEPTED and questState == 2 or Black == QUEST_COMPLETED) then
        count = trade:getItemCount();
        carta = trade:hasItemQty(530, 1);
        
        if (carta == true and count == 1) then
            player:startEvent(0x0288,0,530); --648
        end
       end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    -- "Blackmail" quest status
    blackMail = player:getQuestStatus(SANDORIA, BLACKMAIL);
    envelope = player:hasKeyItem(SUSPICIOUS_ENVELOPE);
    sanFame = player:getFameLevel(SANDORIA);
    homeRank = player:getRank(player:getNation());
    questState = player:getVar("BlackMailQuest");
    

    if (blackMail == QUEST_AVAILABLE and sanFame >= 3 and homeRank >= 3) then
        player:startEvent(0x0283); -- 643 gives me letter
    elseif (blackMail == QUEST_ACCEPTED and envelope == true) then  
        player:startEvent(0x0285);  -- 645 recap, take envelope!
        
    elseif (blackMail == QUEST_ACCEPTED and questState == 1) then
        player:startEvent(0x0286,0,530); --646  after giving letter to H, needs param
        
        
    elseif (blackMail == QUEST_ACCEPTED and questState == 2) then
        player:startEvent(0x0287,0,530); --647 recap of 646
        
    else
        if (player:needToZone() ==true) then
            player:startEvent(0x0282); --642 Quiet!
        else
            player:startEvent(0x0281); --641 -- Quiet! leave me alone
            player:needToZone(true);
        end
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
--print("CSID: %u",csid);
--print("RESULT: %u",option);

    if (csid == 0x0283) then
        player:addQuest(SANDORIA,BLACKMAIL);
        player:addKeyItem(SUSPICIOUS_ENVELOPE);
        player:messageSpecial(KEYITEM_OBTAINED,SUSPICIOUS_ENVELOPE);
    elseif (csid == 0x0286 and option == 1) then
        player:setVar("BlackMailQuest",2);
    elseif (csid == 0x0288) then
        player:tradeComplete();
        player:addGil(GIL_RATE*900);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*900)
        if (player:getQuestStatus(SANDORIA,BLACKMAIL) == QUEST_ACCEPTED) then
            player:addFame(SANDORIA,30);
            player:completeQuest(SANDORIA,BLACKMAIL);
        else
            player:addFame(SANDORIA,5);
        end
    elseif (csid == 0x028 and option == 1) then
        player:addQuest(SANDORIA,BLACKMAIL);
    end

end;