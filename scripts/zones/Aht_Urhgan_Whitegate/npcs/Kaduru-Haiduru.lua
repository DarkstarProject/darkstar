-----------------------------------
-- Area: Aht Urhgan Whitegate
-- NPC: Kaduru-Haiduru
-- Teleport NPC
-----------------------------------

-----------------------------------
-- onTrigger
-----------------------------------
function onTrigger(player, npc)
    local caughtUsingShihuDanhuDate = player:getVar("Kaduru_ShihuDanhu_date");
    local shihuDanhuDate = player:getVar("ShihuDanhu_TP_date");
    local timesUsed = player:getVar("Kaduru_TimesUsed");
    local currentDate = os.date("%j");

    if ((canUse_KaduruHaiduru_Service(player) == 1)) then
        player:startEvent(0x0097, 0, 0, timesUsed, 0, 0, 0, 0, 0, 0);
    else
        if (caughtUsingShihuDanhuDate == 0) then
            player:setVar("Kaduru_ShihuDanhu_date", os.date("%j"));
            player:setVar("Kaduru_TimesUsed", 0);
        end
        player:startEvent(0x0099, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    end
end

function onTrade(player, npc, trade)
    local caughtUsingShihuDanhuDate = player:getVar("Kaduru_ShihuDanhu_date");
    local shihuDanhuDate = player:getVar("ShihuDanhu_TP_date");
    local timesUsed = player:getVar("Kaduru_TimesUsed");

    if ((canUse_KaduruHaiduru_Service(player) == 1) and (timesUsed == 3)) then
        if (trade:getItemCount() == 1) then
            if (trade:hasItemQty(2185, 1)) then
                player:startEvent(0x009A, 0, player:getNation(), 0, 0, 0, 0, 0, 0, 0);
                player:setVar("ShihuDanhu_TP_date", 0);
                player:setVar("Kaduru_ShihuDanhu_date", 0);
            end
        end
    elseif ((canUse_KaduruHaiduru_Service(player) == 1) and (timesUsed < 3)) then
        if (trade:getItemCount() == 1) then
            if (trade:hasItemQty(2185, 1)) then
                player:startEvent(0x0098, 0, 0, 0, 0, 0, 0, 0, 0, 0);
                player:setVar("ShihuDanhu_TP_date", 0);
                player:setVar("Kaduru_ShihuDanhu_date", 0);
            end
        end
    else
        if (caughtUsingShihuDanhuDate == 0) then
            player:setVar("Kaduru_ShihuDanhu_date", os.date("%j"));
            player:setVar("Kaduru_TimesUsed", 0);
        end
        player:startEvent(0x009B, 0, 0, 0, 0, 0, 0, 0, 0, 0);
    end
end

-----------------------------------
-- onEventUpdate
-----------------------------------
function onEventUpdate(player, csid, option)
    --printf("CSID: %u",csid);
    --printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------
function onEventFinish(player, csid, option)
    --printf("CSID: %u",csid);
    --printf("RESULT: %u",option);
    local timesUsed = player:getVar("Kaduru_TimesUsed");
    if (csid == 0x009A) then
        if (option == 1) then       -- Duchy of Jeuno
            player:setPos(0, 3, -6, 190, 243);
        elseif (option == 2) then   -- Nation of Allegiance
            local nation = player:getNation();
            switch (nation): caseof
            {
                [0] = function(x)  -- San d'Oria
                    player:setPos(110, 0, -7, 175, 231);
                end,
                [1] = function(x)  -- Bastok
                    player:setPos(90, 0, -67, 248, 234);
                end,
                [2] = function(x)  -- Windurst
                    player:setPos(192, -12, 218, 60, 240);
                end,
            }
        end
        if (timesUsed < 3) then
            player:setVar("Kaduru_TimesUsed", (timesUsed + 1));
        end
        player:tradeComplete();
    elseif (csid == 0x0098) then    -- Duchy of Jeuno only
        -- We have either not used Kaduru-Haiduru enough, or we were reset after using Shihu-Danhu.
        player:setPos(0, 3, -6, 190, 243);
        if (timesUsed < 3) then
            player:setVar("Kaduru_TimesUsed", (timesUsed + 1));
        end
        player:tradeComplete();
    end
end;

function canUse_KaduruHaiduru_Service(player)
    local caughtUsingShihuDanhuDate = player:getVar("Kaduru_ShihuDanhu_date");
    local shihuDanhuEncounters = player:getVar("ShihuDanhu_Encounters");
    local shihuDanhuDate = player:getVar("ShihuDanhu_TP_date");
    local currentDate = os.date("%j");

    if ((shihuDanhuEncounters < 1) or (shihuDanhuDate == 0) or
        ((shihuDanhuEncounters == 1) and ((currentDate - shihuDanhuDate) < 1) and (caughtUsingShihuDanhuDate == 0)) or 
        (((shihuDanhuEncounters >= 2) and ((currentDate - caughtUsingShihuDanhuDate) >= 1)) and (caughtUsingShihuDanhuDate ~= 0))) then
        -- We've never used Shihu-Danhu's services-- Allow Pass.
        -- , or
        -- We've talked to the little brother only 1 time, and
        -- It's the same day, and this is the first time caught-- Allow Pass.
        -- , or
        -- We've talked to the little brother more than once, and
        -- It has been more than one real-life day since we've used the brother and been caught-- Allow Pass.
        return 1;
    end
    -- Encountered and used Shihu-Danhu's services more than once, and
    -- Have been caught by Kaduru-Haiduru,
    return 0;
end;