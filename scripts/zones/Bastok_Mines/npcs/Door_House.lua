-----------------------------------
-- Area: Bastok Mines
--  NPC: Door_House
-- 17735847 (Corsair's Bottes) @pos 10 0 -16 234
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/zones/Bastok_Mines/TextIDs");
require("scripts/globals/settings");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    local npcID = npc:getID();
    if (npcID == 17735847) then
        local letterBlue = player:getVar("LeleroonsLetterBlue");

        -- mythril sheet, karakul leather, laminated buffalo leather, wolf felt
        if (letterBlue == 2 and trade:getItemCount() == 4 and trade:hasItemQty(663,1) and trade:hasItemQty(879,1) and trade:hasItemQty(2007,1) and trade:hasItemQty(2010,1)) then
            player:startEvent(521); -- accepts materials, now bring me 4 imperial mythril pieces

        -- 4 imperial mythril pieces
        elseif (letterBlue == 3 and trade:getItemCount() == 4 and trade:hasItemQty(2186,4)) then
            player:startEvent(524); -- accepts mythril pieces, now wait for next vana'diel day

        end
    end;
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local npcID = npc:getID();
    if (npcID == 17735847) then
        local letterBlue = player:getVar("LeleroonsletterBlue");
        if (player:hasKeyItem(LELEROONS_LETTER_BLUE)) then
            player:startEvent(519); -- accept letter, now bring me four items
        elseif (letterBlue == 2) then
            player:startEvent(520); -- i'm waiting for four items
        elseif (letterBlue == 3) then
            player:startEvent(535); -- i'm waiting for 4 imperial mythril pieces
        elseif (letterBlue == 4) then
            if (vanaDay() > player:getVar("corAfSubmitDay")) then
                player:startEvent(522); -- here's your cor bottes
            else
                player:startEvent(523); -- patience. need to wait for vana'diel day
            end;
        end;
    end;
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
    if (csid == 519) then
        player:setVar("LeleroonsletterBlue", 2);
        player:delKeyItem(LELEROONS_LETTER_BLUE);
    elseif (csid == 521) then
        player:tradeComplete();
        player:setVar("LeleroonsletterBlue", 3);
    elseif (csid == 524) then
        player:tradeComplete();
        player:setVar("LeleroonsletterBlue", 4);
        player:setVar("corAfSubmitDay", vanaDay());
    elseif (csid == 522) then
        player:setVar("LeleroonsletterBlue", 5);
        player:addItem(15685); -- corsair's bottes
        player:messageSpecial(ITEM_OBTAINED,15685);
    end;
end;
