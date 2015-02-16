-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC:  Mrohk Sahjuuli
-- Salvage +1 and Nyzul items
-- @pos 23 0 -88
-----------------------------------
package.loaded["scripts/zones/Aht_Urhgan_Whitegate/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Aht_Urhgan_Whitegate/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------
function onTrade(player,npc,trade)
    local compansationamount = 5;
    local compensation = 2187; -- Imp. Gold Piece
    local matsquanity = 0;
    local upgradeitem = 0;
    local reward = 0;
    local mats = 0;
    local csid = 0;

    ----------------------------Askar-Phorcys-----------------------------------

    if (trade:hasItemQty(16106,1) and trade:getItemCount() == 1) then
        upgradeitem = 16106; -- Head
        csid = 970;
        mats = 4023;
        matsquanity = 8;
    elseif (trade:hasItemQty(4023,8) and trade:hasItemQty(16106,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 14) then
        csid = 971;
        reward = 10901;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(14568,1) and trade:getItemCount() == 1) then
        upgradeitem = 14568; -- Body
        csid = 970;
        mats = 4023;
        matsquanity = 8;
    elseif (trade:hasItemQty(4023,8) and trade:hasItemQty(14568,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 14) then
        csid = 971;
        reward = 10474;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(14983,1) and trade:getItemCount() == 1) then
        upgradeitem = 14983; -- Hands
        csid = 970;
        mats = 4023;
        matsquanity = 8;
    elseif (trade:hasItemQty(4023,8) and trade:hasItemQty(14983,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 14) then
        csid = 971;
        reward = 10523;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(15647,1) and trade:getItemCount() == 1) then
        upgradeitem = 15647; -- Legs
        csid = 970;
        mats = 4023;
        matsquanity = 8;
    elseif (trade:hasItemQty(4023,8) and trade:hasItemQty(15647,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 14) then
        csid = 971;
        reward = 10554;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(15733,1) and trade:getItemCount() == 1) then
        upgradeitem = 15733; -- Feet
        csid = 970;
        mats = 4023;
        matsquanity = 8;
    elseif (trade:hasItemQty(4023,8) and trade:hasItemQty(15733,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 14) then
        csid = 971;
        reward = 10620;
        player:setVar("NyzulTradeItem",reward);

    ----------------------------Denali-Thaumas------------------------------------

    elseif (trade:hasItemQty(16107,1) and trade:getItemCount() == 1) then
        upgradeitem = 16107; -- Head
        csid = 970;
        mats = 4023;
        matsquanity = 8;
    elseif (trade:hasItemQty(4023,8) and trade:hasItemQty(16107,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 14) then
        csid = 971;
        reward = 10906;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(14569,1) and trade:getItemCount() == 1) then
        upgradeitem = 14569; -- Body
        csid = 970;
        mats = 4023;
        matsquanity = 8;
    elseif (trade:hasItemQty(4023,8) and trade:hasItemQty(14569,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 14) then
        csid = 971;
        reward = 10479;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(14984,1) and trade:getItemCount() == 1) then
        upgradeitem = 14984; -- Hands
        csid = 970;
        mats = 4023;
        matsquanity = 8;
    elseif (trade:hasItemQty(4023,8) and trade:hasItemQty(14984,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 14) then
        csid = 971;
        reward = 10528;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(15648,1) and trade:getItemCount() == 1) then
        upgradeitem = 15648; -- Legs
        csid = 970;
        mats = 4023;
        matsquanity = 8;
    elseif (trade:hasItemQty(4023,8) and trade:hasItemQty(15648,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 14) then
        csid = 971;
        reward = 10559;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(15734,1) and trade:getItemCount() == 1) then
        upgradeitem = 15734; -- Feet
        csid = 970;
        mats = 4023;
        matsquanity = 8;
    elseif (trade:hasItemQty(4023,8) and trade:hasItemQty(15734,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 14) then
        csid = 971;
        reward = 10625;
        player:setVar("NyzulTradeItem",reward);

    ----------------------------Goliard-Nares------------------------------------

    elseif (trade:hasItemQty(16108,1) and trade:getItemCount() == 1) then
        upgradeitem = 16108; -- Head
        csid = 970;
        mats = 4023;
        matsquanity = 8;
    elseif (trade:hasItemQty(4023,8) and trade:hasItemQty(16108,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 14) then
        csid = 971;
        reward = 10911;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(14570,1) and trade:getItemCount() == 1) then
        upgradeitem = 14570; -- Body
        csid = 970;
        mats = 4023;
        matsquanity = 8;
    elseif (trade:hasItemQty(4023,8) and trade:hasItemQty(14570,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 14) then
        csid = 971;
        reward = 10484;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(14985,1) and trade:getItemCount() == 1) then
        upgradeitem = 14985; -- Hands
        csid = 970;
        mats = 4023;
        matsquanity = 8;
    elseif (trade:hasItemQty(4023,8) and trade:hasItemQty(14985,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 14) then
        csid = 971;
        reward = 10533;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(15649,1) and trade:getItemCount() == 1) then
        upgradeitem = 15649; -- Legs
        csid = 970;
        mats = 4023;
        matsquanity = 8;
    elseif (trade:hasItemQty(4023,8) and trade:hasItemQty(15649,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 14) then
        csid = 971;
        reward = 10564;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(15735,1) and trade:getItemCount() == 1) then
        upgradeitem = 15735; -- Feet
        csid = 970;
        mats = 4023;
        matsquanity = 8;
    elseif (trade:hasItemQty(4023,8) and trade:hasItemQty(15735,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 14) then
        csid = 971;
        reward = 10630;
        player:setVar("NyzulTradeItem",reward);

    ----------------------------Ares-------------------------------------

    elseif (trade:hasItemQty(16084,1) and trade:getItemCount() == 1) then
        upgradeitem = 16084; -- Head
        csid = 970;
        mats = 27658;
        matsquanity = 1;
    elseif (trade:hasItemQty(16084,1) and trade:hasItemQty(27658,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7) then
        csid = 971;
        reward = 10901;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(14546,1) and trade:getItemCount() == 1) then
        upgradeitem = 14546; -- Body
        csid = 970;
        mats = 27798;
        matsquanity = 1;
    elseif (trade:hasItemQty(14546,1) and trade:hasItemQty(27798,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7) then
        csid = 971;
        reward = 27788;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(14961,1) and trade:getItemCount() == 1) then
        upgradeitem = 14961; -- Hands
        csid = 970;
        mats = 27938;
        matsquanity = 1;
    elseif (trade:hasItemQty(14961,1) and trade:hasItemQty(27938,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7) then
        csid = 971;
        reward = 27928;
        player:setVar("NyzulTradeItem",reward);
    elseif(trade:hasItemQty(15625,1) and trade:getItemCount() == 1) then
        upgradeitem = 15625; -- Legs
        csid = 970;
        mats = 28081;
        matsquanity = 1;
    elseif (trade:hasItemQty(15625,1) and trade:hasItemQty(28081,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7) then
        csid = 971;
        reward = 28071;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(15711,1) and trade:getItemCount() == 1) then
        upgradeitem = 15711; -- Feet
        csid = 970;
        mats = 28218;
        matsquanity = 1;
    elseif (trade:hasItemQty(15711,1) and trade:hasItemQty(28218,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7) then
        csid = 971;
        reward = 28208;
        player:setVar("NyzulTradeItem",reward);

    ----------------------------Usukane-------------------------------------

    elseif (trade:hasItemQty(16092,1) and trade:getItemCount() == 1) then
        upgradeitem = 16092; -- Head
        csid = 970;
        mats = 27660;
        matsquanity = 1;
    elseif (trade:hasItemQty(16092,1) and trade:hasItemQty(27660,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7) then
        csid = 971;
        reward = 27650;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(14554,1) and trade:getItemCount() == 1) then
        upgradeitem = 14554; -- Body
        csid = 970;
        mats = 27800;
        matsquanity = 1;
    elseif (trade:hasItemQty(14554,1) and trade:hasItemQty(27800,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7) then
        csid = 971;
        reward = 27790;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(14969,1) and trade:getItemCount() == 1) then
        upgradeitem = 14969; -- Hands
        csid = 970;
        mats = 27940;
        matsquanity = 1;
    elseif (trade:hasItemQty(14969,1) and trade:hasItemQty(27940,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7) then
        csid = 971;
        reward = 27930;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(15633,1) and trade:getItemCount() == 1) then
        upgradeitem = 15633; -- Legs
        csid = 970;
        mats = 28083;
        matsquanity = 1;
    elseif (trade:hasItemQty(15633,1) and trade:hasItemQty(28083,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7) then
        csid = 971;
        reward = 28073;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(15719,1) and trade:getItemCount() == 1) then
        upgradeitem = 15719; -- Feet
        csid = 970;
        mats = 28220;
        matsquanity = 1;
    elseif (trade:hasItemQty(15719,1) and trade:hasItemQty(28220,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7) then
        csid = 971;
        reward = 28210;
        player:setVar("NyzulTradeItem",reward);

    ----------------------------Skadi-------------------------------------

    elseif (trade:hasItemQty(16088,1) and trade:getItemCount() == 1) then
        upgradeitem = 16088; -- Head
        csid = 970;
        mats = 27659;
        matsquanity = 1;
    elseif (trade:hasItemQty(16088,1) and trade:hasItemQty(27659,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7) then
        csid = 971;
        reward = 27649;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(14550,1) and trade:getItemCount() == 1) then
        upgradeitem = 14550; -- Body
        csid = 970;
        mats = 27799;
        matsquanity = 1;
    elseif (trade:hasItemQty(14550,1) and trade:hasItemQty(27799,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7) then
        csid = 971;
        reward = 27789;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(14965,1) and trade:getItemCount() == 1) then
        upgradeitem = 14965; -- Hands
        csid = 970;
        mats = 27939;
        matsquanity = 1;
    elseif (trade:hasItemQty(14965,1) and trade:hasItemQty(27939,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7) then
        csid = 971;
        reward = 27929;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(15629,1) and trade:getItemCount() == 1) then
        upgradeitem = 15629; -- Legs
        csid = 970;
        mats = 28082;
        matsquanity = 1;
    elseif (trade:hasItemQty(15629,1) and trade:hasItemQty(28082,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7) then
        csid = 971;
        reward = 28072;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(15715,1) and trade:getItemCount() == 1) then
        upgradeitem = 15715; -- Feet
        csid = 970;
        mats = 28219;
        matsquanity = 1;
    elseif (trade:hasItemQty(15715,1) and trade:hasItemQty(28219,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7) then
        csid = 971;
        reward = 28209;
        player:setVar("NyzulTradeItem",reward);

    ----------------------------Morrigans-------------------------------------

    elseif (trade:hasItemQty(16100,1) and trade:getItemCount() == 1) then
        upgradeitem = 16100; -- Head
        csid = 970;
        mats = 27662;
        matsquanity = 1;
    elseif (trade:hasItemQty(16100,1) and trade:hasItemQty(27662,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7) then
        csid = 971;
        reward = 27652;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(14562,1) and trade:getItemCount() == 1) then
        upgradeitem = 14562; -- Body
        csid = 970;
        mats = 27802;
        matsquanity = 1;
    elseif (trade:hasItemQty(14562,1) and trade:hasItemQty(27802,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7) then
        csid = 971;
        reward = 27792;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(14977,1) and trade:getItemCount() == 1) then
        upgradeitem = 14977; -- Hands
        csid = 970;
        mats = 27942;
        matsquanity = 1;
    elseif (trade:hasItemQty(14977,1) and trade:hasItemQty(27942,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7) then
        csid = 971;
        reward = 27932;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(15641,1) and trade:getItemCount() == 1) then
        upgradeitem = 15641; -- Legs
        csid = 970;
        mats = 28085;
        matsquanity = 1;
    elseif (trade:hasItemQty(15641,1) and trade:hasItemQty(28085,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7) then
        csid = 971;
        reward = 28075;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(15727,1) and trade:getItemCount() == 1) then
        upgradeitem = 15727; -- Feet
        csid = 970;
        mats = 28222;
        matsquanity = 1;
    elseif (trade:hasItemQty(15727,1) and trade:hasItemQty(28222,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7) then
        csid = 971;
        reward = 28212;
        player:setVar("NyzulTradeItem",reward);

    ----------------------------Mardukes-------------------------------------

    elseif (trade:hasItemQty(16096,1) and trade:getItemCount() == 1) then
        upgradeitem = 16096; -- Head
        csid = 970;
        mats = 27661;
        matsquanity = 1;
    elseif (trade:hasItemQty(16096,1) and trade:hasItemQty(27661,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7) then
        csid = 971;
        reward = 27651;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(14558,1) and trade:getItemCount() == 1) then
        upgradeitem = 14558; -- Body
        csid = 970;
        mats = 27801;
        matsquanity = 1;
    elseif (trade:hasItemQty(14558,1) and trade:hasItemQty(27801,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7) then
        csid = 971;
        reward = 27791;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(14973,1) and trade:getItemCount() == 1) then
        upgradeitem = 14973; -- Hands
        csid = 970;
        mats = 27658;
        matsquanity = 1;
    elseif (trade:hasItemQty(14973,1) and trade:hasItemQty(27941,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7) then
        csid = 971;
        reward = 27931;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(15637,1) and trade:getItemCount() == 1) then
        upgradeitem = 15637; -- Legs
        csid = 970;
        mats = 28084;
        matsquanity = 1;
    elseif (trade:hasItemQty(15637,1) and trade:hasItemQty(28084,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7) then
        csid = 971;
        reward = 28074;
        player:setVar("NyzulTradeItem",reward);
    elseif (trade:hasItemQty(15723,1) and trade:getItemCount() == 1) then
        upgradeitem = 15723; -- Feet
        csid = 970;
        mats = 28221;
        matsquanity = 1;
    elseif (trade:hasItemQty(15723,1) and trade:hasItemQty(28221,1) and trade:hasItemQty(compensation,compansationamount) and trade:getItemCount() == 7 ) then
        csid = 971;
        reward = 28211;
        player:setVar("NyzulTradeItem",reward);
    end

    if (csid == 970) then
        player:startEvent(970, mats, upgradeitem, matsquanity, compensation, compansationamount);
    elseif (csid == 971) then
        local reward = player:getVar("NyzulTradeItem");
        player:startEvent(971, reward);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------
-- csid 969 - 976
function onTrigger(player,npc)
    player:startEvent(969);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    local reward = player:getVar("NyzulTradeItem");
    if (csid == 971) then
        if (option == 6) then
            player:messageSpecial(ITEM_OBTAINED, reward);
            player:addItem( reward );
            player:tradeComplete();
        end
    end
-- printf("CSID: %u",csid);
-- printf("RESULT: %u",option);
end;