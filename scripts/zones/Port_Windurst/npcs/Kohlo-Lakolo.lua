-----------------------------------
-- Area: Port Windurst
-- NPC: Kohlo-Lakolo
-- Invloved In Quests: Truth, Justice, and the Onion Way!,
--                       Know One's Onions,
--                       Inspector's Gadget,
--                       Onion Rings,
--                     Crying Over Onions,
--                     Wild Card,
--                     The Promise
-----------------------------------
package.loaded["scripts/zones/Port_Windurst/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/titles");
require("scripts/globals/quests");
require("scripts/globals/keyitems");
require("scripts/globals/settings");
require("scripts/zones/Port_Windurst/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

TruthJusticeOnionWay = player:getQuestStatus(WINDURST,TRUTH_JUSTICE_AND_THE_ONION_WAY);
KnowOnesOnions       = player:getQuestStatus(WINDURST,KNOW_ONE_S_ONIONS);

    if (KnowOnesOnions == QUEST_ACCEPTED) then
        count = trade:getItemCount();
        WildOnion = trade:hasItemQty(4387,4);

        if (WildOnion == true and count == 4) then
            player:startEvent(398,0,4387);
        end    
    elseif (TruthJusticeOnionWay == QUEST_ACCEPTED) then
        count = trade:getItemCount();
        RarabTail = trade:hasItemQty(4444,1);

        if (RarabTail == true and count == 1) then
            player:startEvent(378,0,4444);
        end
    end
    
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

TruthJusticeOnionWay = player:getQuestStatus(WINDURST,TRUTH_JUSTICE_AND_THE_ONION_WAY);
KnowOnesOnions       = player:getQuestStatus(WINDURST,KNOW_ONE_S_ONIONS);
InspectorsGadget     = player:getQuestStatus(WINDURST,INSPECTOR_S_GADGET);
OnionRings           = player:getQuestStatus(WINDURST,ONION_RINGS);
CryingOverOnions     = player:getQuestStatus(WINDURST,CRYING_OVER_ONIONS);
WildCard   = player:getQuestStatus(WINDURST,WILD_CARD);
ThePromise = player:getQuestStatus(WINDURST,THE_PROMISE);
NeedToZone = player:needToZone();
Level      = player:getMainLvl();
Fame       = player:getFameLevel(WINDURST);

    if (ThePromise == QUEST_COMPLETED) then
        player:startEvent(544);
    elseif (ThePromise == QUEST_ACCEPTED) then
        InvisibleManSticker = player:hasKeyItem(INVISIBLE_MAN_STICKER);
        
        if (InvisibleManSticker == true) then
            ThePromiseCS_Seen = player:getVar("ThePromiseCS_Seen");
            
            if (ThePromiseCS_Seen == 1) then
                FreeSlots = player:getFreeSlotsCount();
                
                if (FreeSlots >= 1) then
                    player:completeQuest(WINDURST,THE_PROMISE);
                    player:addFame(WINDURST,150);
                    player:delKeyItem(INVISIBLE_MAN_STICKER);
                    player:addItem(13135);
                    player:messageSpecial(ITEM_OBTAINED,13135);
                    player:setVar("ThePromise",0);
                    player:setVar("ThePromiseCS_Seen",0);
                else
                    player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13135);
                end
            else
                player:startEvent(522,0,INVISIBLE_MAN_STICKER);
            end
        else
            player:startEvent(514);
        end
    elseif (WildCard == QUEST_COMPLETED) then
        player:startEvent(513,0,INVISIBLE_MAN_STICKER);
    elseif (WildCard == QUEST_ACCEPTED) then
        WildCardVar = player:getVar("WildCard");
        
        if (WildCardVar == 0) then
            player:setVar("WildCard",1);
        end
        
        player:showText(npc,KOHLO_LAKOLO_DIALOG_A);
    elseif (CryingOverOnions == QUEST_COMPLETED) then
        player:startEvent(505);
    elseif (CryingOverOnions == QUEST_ACCEPTED) then
        CryingOverOnionsVar = player:getVar("CryingOverOnions");
        
        if (CryingOverOnionsVar == 3) then
            player:startEvent(512);
        elseif (CryingOverOnionsVar == 2) then
            player:startEvent(497);
        else
            player:startEvent(498);
        end
    elseif (OnionRings == QUEST_COMPLETED) then
        if (NeedToZone == false and Fame >= 5) then
            player:startEvent(496);
        else
            player:startEvent(440);
        end
    elseif (OnionRings == QUEST_ACCEPTED) then
        OldRing = player:hasKeyItem(OLD_RING);
        
        if (OldRing == true) then
            OnionRingsTime = player:getVar("OnionRingsTime");
            CurrentTime    = os.time();
            
            if (CurrentTime >= OnionRingsTime) then
                player:startEvent(433);
            else
                player:startEvent(431);
            end    
        end
    elseif (InspectorsGadget == QUEST_COMPLETED) then
        if (NeedToZone == false and Fame >= 3) then
            OldRing = player:hasKeyItem(OLD_RING);
            
            if (OldRing == true) then
                OnionRingsVar = player:getVar("OnionRings");
                
                if (OnionRingsVar == 1) then
                    player:startEvent(430,0,OLD_RING);
                else
                    player:startEvent(432,0,OLD_RING);
                end
            else
                player:startEvent(429);
            end
        else
            player:startEvent(422);
        end        
    elseif (InspectorsGadget == QUEST_ACCEPTED) then
        FakeMoustache = player:hasKeyItem(FAKE_MOUSTACHE);
        
        if (FakeMoustache == true) then
            player:startEvent(421);
        else
            player:startEvent(414);
        end
    elseif (KnowOnesOnions == QUEST_COMPLETED) then
        if (NeedToZone == false and Fame >= 2) then
            player:startEvent(413);
        else
            player:startEvent(401);
        end
    elseif (KnowOnesOnions == QUEST_ACCEPTED) then
        KnowOnesOnionsVar  = player:getVar("KnowOnesOnions");
        KnowOnesOnionsTime = player:getVar("KnowOnesOnionsTime");
        CurrentTime = os.time();
        
        if (KnowOnesOnionsVar == 2) then
            player:startEvent(400);            
        elseif (KnowOnesOnionsVar == 1 and CurrentTime >= KnowOnesOnionsTime) then
            player:startEvent(386);
        elseif (KnowOnesOnionsVar == 1) then
            player:startEvent(399,0,4387);
        else
            player:startEvent(392,0,4387);
        end
    elseif (TruthJusticeOnionWay == QUEST_COMPLETED) then        
        if (NeedToZone == false and Level >= 5) then
            player:startEvent(391,0,4387); 
        else
            player:startEvent(379);
        end
    elseif (TruthJusticeOnionWay == QUEST_ACCEPTED) then
        player:startEvent(371);
    elseif (TruthJusticeOnionWay == QUEST_AVAILABLE) then
        player:startEvent(368);
    else
        player:startEvent(361);
    end
   
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID2: %u",csid);
    -- printf("RESULT2: %u",option);

end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 368 and option == 0) then
        player:addQuest(WINDURST,TRUTH_JUSTICE_AND_THE_ONION_WAY);         
    elseif (csid == 378) then
        FreeSlots = player:getFreeSlotsCount();
        
        if (FreeSlots >= 1) then
            player:completeQuest(WINDURST,TRUTH_JUSTICE_AND_THE_ONION_WAY);
            player:addFame(WINDURST,75);
            player:addTitle(STAR_ONION_BRIGADE_MEMBER);
            player:tradeComplete();
            player:addItem(13093);
            player:messageSpecial(ITEM_OBTAINED,13093);
            player:needToZone(true);
        else
            player:messageSpecial(FULL_INVENTORY_AFTER_TRADE,13093);
        end
    elseif (csid == 391) then
        player:addQuest(WINDURST,KNOW_ONE_S_ONIONS);
    elseif (csid == 398) then
        FreeSlots = player:getFreeSlotsCount();
        
        if (FreeSlots >= 1) then
            TradeTime = os.time();
            
            player:tradeComplete();
            player:addItem(4857);
            player:messageSpecial(ITEM_OBTAINED,4857);
            player:setVar("KnowOnesOnions",1);
            player:setVar("KnowOnesOnionsTime", TradeTime + 86400);
        else
            player:messageSpecial(FULL_INVENTORY_AFTER_TRADE,4857);
        end
    elseif (csid == 386 or csid == 400) then
        player:completeQuest(WINDURST,KNOW_ONE_S_ONIONS);
        player:addFame(WINDURST,80);
        player:addTitle(SOB_SUPER_HERO);    
        player:setVar("KnowOnesOnions",0);
        player:setVar("KnowOnesOnionsTime",0);
        player:needToZone(true);
    elseif (csid == 413 and option == 0) then
        player:addQuest(WINDURST,INSPECTOR_S_GADGET);
    elseif (csid == 421) then
        FreeSlots = player:getFreeSlotsCount();
        
        if (FreeSlots >= 1) then
            player:completeQuest(WINDURST,INSPECTOR_S_GADGET);
            player:addFame(WINDURST,90);
            player:addTitle(FAKEMOUSTACHED_INVESTIGATOR);    
            player:addItem(13204);
            player:messageSpecial(ITEM_OBTAINED,13204);
            player:needToZone(true);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13204);
        end
    elseif (csid == 429) then
        player:setVar("OnionRings",1);
    elseif (csid == 430) then
        OnionRings = player:getQuestStatus(WINDURST,ONION_RINGS);
        
        if (OnionRings == QUEST_AVAILABLE) then
            CurrentTime = os.time();
            
            player:addQuest(WINDURST,ONION_RINGS);
            player:setVar("OnionRingsTime", CurrentTime + 86400);
        end
    elseif (csid == 432 or csid == 433) then
        player:completeQuest(WINDURST,ONION_RINGS);
        player:addFame(WINDURST,100);
        player:addTitle(STAR_ONION_BRIGADIER);
        player:delKeyItem(OLD_RING);
        player:setVar("OnionRingsTime",0);
        player:needToZone(true);
    elseif (csid == 440) then
        OnionRingsVar    = player:getVar("OnionRings");
        NeedToZone = player:getVar("NeedToZone");
        
        if (OnionRingsVar == 2 and NeedToZone == 0) then
            FreeSlots = player:getFreeSlotsCount();
            
            if (FreeSlots >= 1) then
                player:setVar("OnionRings",0);
                player:addItem(17029);
                player:messageSpecial(ITEM_OBTAINED,17029);
            else
                player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,17029);
            end
        end
    elseif (csid == 496) then
        player:addQuest(WINDURST,CRYING_OVER_ONIONS);
    elseif (csid == 497) then
        player:setVar("CryingOverOnions",3);
    elseif (csid == 513) then
        player:addQuest(WINDURST,THE_PROMISE);
    elseif (csid == 522) then
        FreeSlots = player:getFreeSlotsCount();
        
        if (FreeSlots >= 1) then
            player:completeQuest(WINDURST,THE_PROMISE);
            player:addFame(WINDURST,150);
            player:delKeyItem(INVISIBLE_MAN_STICKER);
            player:addItem(13135);
            player:messageSpecial(ITEM_OBTAINED,13135);
            player:setVar("ThePromise",0);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,13135);
            player:setVar("ThePromiseCS_Seen",1);
        end
    end
end;