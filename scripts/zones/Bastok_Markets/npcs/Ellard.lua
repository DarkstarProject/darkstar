-----------------------------------
--  Area: Bastok Markets
--   NPC: Ellard
--  Type: Guildworker's Union Representative
-- @zone: 235
--  @pos -214.355 -7.814 -63.809
-----------------------------------

package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
require("scripts/globals/keyitems");
require("scripts/globals/crafting");
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    unionRepresentativeTrade(player, trade, 0x155, 0, 3);
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local rank = player:getSkillRank(51); --goldsmithing rank
    local cap = (rank + 1) * 10;
    local keyitems = 0;
    if (rank >= 3) then
        if not player:hasKeyItem(GOLD_PURIFICATION) then
            keyitems = bit.bor(keyitems, bit.lshift(1,0));
        end
        if not player:hasKeyItem(GOLD_ENSORCELLMENT) then
            keyitems = bit.bor(keyitems, bit.lshift(1,1));
        end
        if not player:hasKeyItem(CHAINWORK) then
            keyitems = bit.bor(keyitems, bit.lshift(1,2));
        end
        if not player:hasKeyItem(SHEETING) then
            keyitems = bit.bor(keyitems, bit.lshift(1,3));
        end
        if not player:hasKeyItem(CLOCKMAKING) then
            keyitems = bit.bor(keyitems, bit.lshift(1,4));
        end
    end
    if (rank >= 9) then
        if not player:hasKeyItem(WAY_OF_THE_GOLDSMITH) then
            keyitems = bit.bor(keyitems, bit.lshift(1,5));
        end
    end
	unionRepresentativeTrigger(player, 3, 0x154, "guild_goldsmithing", cap, keyitems)
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

function onEventFinish(player,csid,option,target)
	 printf("CSID: %u",csid);
	 printf("RESULT: %u",option);
     
    if (csid == 0x154) then
        if (option == -1) then
            player:setVar('[GUILD]currentGuild',3);
            player:setVar('[GUILD]daily_points',-1);
            return;
        end
        local rank = player:getSkillRank(51); --goldsmithing rank
        if (bit.band(option, 32) > 0) then --keyitem
            if (bit.band(option, 31) == 0) then
                if (rank >= 3) then
                    if (player:getCurrency("guild_goldsmithing") >= 40000) then
                        player:delCurrency("guild_goldsmithing", 40000);
                        player:addKeyItem(GOLD_PURIFICATION);
                        player:messageSpecial(KEYITEM_OBTAINED, GOLD_PURIFICATION);
                    else
                        player:messageText(target, NOT_HAVE_ENOUGH_GP, false, 6);
                    end
                end
            elseif (bit.band(option, 31) == 1) then
                if (rank >= 3) then
                    if (player:getCurrency("guild_goldsmithing") >= 40000) then
                        player:delCurrency("guild_goldsmithing", 40000);
                        player:addKeyItem(GOLD_ENSORCELLMENT);
                        player:messageSpecial(KEYITEM_OBTAINED, GOLD_ENSORCELLMENT);
                    else
                        player:messageText(target, NOT_HAVE_ENOUGH_GP, false, 6);
                    end
                end
            elseif (bit.band(option, 31) == 2) then
                if (rank >= 3) then
                    if (player:getCurrency("guild_goldsmithing") >= 10000) then
                        player:delCurrency("guild_goldsmithing", 10000);
                        player:addKeyItem(CHAINWORK);
                        player:messageSpecial(KEYITEM_OBTAINED, CHAINWORK);
                    else
                        player:messageText(target, NOT_HAVE_ENOUGH_GP, false, 6);
                    end
                end
            elseif (bit.band(option, 31) == 3) then
                if (rank >= 3) then
                    if (player:getCurrency("guild_goldsmithing") >= 10000) then
                        player:delCurrency("guild_goldsmithing", 10000);
                        player:addKeyItem(SHEETING);
                        player:messageSpecial(KEYITEM_OBTAINED, SHEETING);
                    else
                        player:messageText(target, NOT_HAVE_ENOUGH_GP, false, 6);
                    end
                end
            elseif (bit.band(option, 31) == 4) then
                if (rank >= 3) then
                    if (player:getCurrency("guild_goldsmithing") >= 10000) then
                        player:delCurrency("guild_goldsmithing", 10000);
                        player:addKeyItem(CLOCKMAKING);
                        player:messageSpecial(KEYITEM_OBTAINED, CLOCKMAKING);
                    else
                        player:messageText(target, NOT_HAVE_ENOUGH_GP, false, 6);
                    end
                end
            elseif (bit.band(option, 31) == 5) then
                if (rank >= 9) then
                    if (player:getCurrency("guild_goldsmithing") >= 20000) then
                        player:delCurrency("guild_goldsmithing", 20000);
                        player:addKeyItem(WAY_OF_THE_GOLDSMITH);
                        player:messageSpecial(KEYITEM_OBTAINED, WAY_OF_THE_GOLDSMITH);
                    else
                        player:messageText(target, NOT_HAVE_ENOUGH_GP, false, 6);
                    end
                end
            end
        elseif (bit.band(option, 16) > 0) then --item
            if (bit.band(option, 15) == 2) then
                if (rank >= 3) then
                    if (player:getCurrency("guild_goldsmithing") >= 10000) then
                        if (player:getFreeSlotsCount() > 0) then
                            player:delCurrency("guild_goldsmithing", 10000);
                            player:addItem(15446);
                            player:messageSpecial(ITEM_OBTAINED, 15446);
                        else
                            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 15446);
                        end
                    else
                        player:messageText(target, NOT_HAVE_ENOUGH_GP, false, 6);
                    end
                end
            elseif (bit.band(option, 15) == 3) then
                if (rank >= 5) then
                    if (player:getCurrency("guild_goldsmithing") >= 70000) then
                        if (player:getFreeSlotsCount() > 0) then
                            player:delCurrency("guild_goldsmithing", 70000);
                            player:addItem(13945);
                            player:messageSpecial(ITEM_OBTAINED, 13945);
                        else
                            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 13945);
                        end
                    else
                        player:messageText(target, NOT_HAVE_ENOUGH_GP, false, 6);
                    end
                end
            elseif (bit.band(option, 15) == 4) then
                if (rank >= 7) then
                    if (player:getCurrency("guild_goldsmithing") >= 100000) then
                        if (player:getFreeSlotsCount() > 0) then
                            player:delCurrency("guild_goldsmithing", 100000);
                            player:addItem(15446);
                            player:messageSpecial(ITEM_OBTAINED, 15446);
                        else
                            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 15446);
                        end
                    else
                        player:messageText(target, NOT_HAVE_ENOUGH_GP, false, 6);
                    end
                end
            elseif (bit.band(option, 15) == 5) then
                if (rank >= 9) then
                    if (player:getCurrency("guild_goldsmithing") >= 150000) then
                        if (player:getFreeSlotsCount() > 0) then
                            player:delCurrency("guild_goldsmithing", 150000);
                            player:addItem(14394);
                            player:messageSpecial(ITEM_OBTAINED, 14394);
                        else
                            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 14394);
                        end
                    else
                        player:messageText(target, NOT_HAVE_ENOUGH_GP, false, 6);
                    end
                end
            elseif (bit.band(option, 15) == 6) then
                if (rank >= 9) then
                    if (player:getCurrency("guild_goldsmithing") >= 200000) then
                        if (player:getFreeSlotsCount() > 0) then
                            player:delCurrency("guild_goldsmithing", 200000);
                            player:addItem(335);
                            player:messageSpecial(ITEM_OBTAINED, 335);
                        else
                            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 335);
                        end
                    else
                        player:messageText(target, NOT_HAVE_ENOUGH_GP, false, 6);
                    end
                end
            elseif (bit.band(option, 15) == 7) then
                if (rank >= 6) then
                    if (player:getCurrency("guild_goldsmithing") >= 80000) then
                        if (player:getFreeSlotsCount() > 0) then
                            player:delCurrency("guild_goldsmithing", 80000);
                            player:addItem(15821);
                            player:messageSpecial(ITEM_OBTAINED, 15821);
                        else
                            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 15821);
                        end
                    else
                        player:messageText(target, NOT_HAVE_ENOUGH_GP, false, 6);
                    end
                end
            elseif (bit.band(option, 15) == 8) then
                if (rank >= 7) then
                    if (player:getCurrency("guild_goldsmithing") >= 50000) then
                        if (player:getFreeSlotsCount() > 0) then
                            player:delCurrency("guild_goldsmithing", 50000);
                            player:addItem(3595);
                            player:messageSpecial(ITEM_OBTAINED, 3595);
                        else
                            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 3595);
                        end
                    else
                        player:messageText(target, NOT_HAVE_ENOUGH_GP, false, 6);
                    end
                end
            elseif (bit.band(option, 15) == 9) then
                if (rank >= 9) then
                    if (player:getCurrency("guild_goldsmithing") >= 15000) then
                        if (player:getFreeSlotsCount() > 0) then
                            player:delCurrency("guild_goldsmithing", 15000);
                            player:addItem(3325);
                            player:messageSpecial(ITEM_OBTAINED, 3325);
                        else
                            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 3325);
                        end
                    else
                        player:messageText(target, NOT_HAVE_ENOUGH_GP, false, 6);
                    end
                end
            end
        else -- HQ crystal (or nothing)
            if (option == 1) then
                if (rank >= 3) then
                    if (player:getCurrency("guild_goldsmithing") >= 200) then
                        if (player:getFreeSlotsCount() > 0) then
                            player:delCurrency("guild_goldsmithing", 200);
                            player:addItem(4238);
                            player:messageSpecial(ITEM_OBTAINED, 4238);
                        else
                            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 4238);
                        end
                    else
                        player:messageText(target, NOT_HAVE_ENOUGH_GP, false, 6);
                    end
                end
            elseif (option == 2) then
                if (rank >= 3) then
                    if (player:getCurrency("guild_goldsmithing") >= 200) then
                        if (player:getFreeSlotsCount() > 0) then
                            player:delCurrency("guild_goldsmithing", 200);
                            player:addItem(4239);
                            player:messageSpecial(ITEM_OBTAINED, 4239);
                        else
                            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 4239);
                        end
                    else
                        player:messageText(target, NOT_HAVE_ENOUGH_GP, false, 6);
                    end
                end
            elseif (option == 3) then
                if (rank >= 3) then
                    if (player:getCurrency("guild_goldsmithing") >= 200) then
                        if (player:getFreeSlotsCount() > 0) then
                            player:delCurrency("guild_goldsmithing", 200);
                            player:addItem(4240);
                            player:messageSpecial(ITEM_OBTAINED, 4240);
                        else
                            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 4240);
                        end
                    else
                        player:messageText(target, NOT_HAVE_ENOUGH_GP, false, 6);
                    end
                end
            elseif (option == 4) then
                if (rank >= 3) then
                    if (player:getCurrency("guild_goldsmithing") >= 200) then
                        if (player:getFreeSlotsCount() > 0) then
                            player:delCurrency("guild_goldsmithing", 200);
                            player:addItem(4241);
                            player:messageSpecial(ITEM_OBTAINED, 4241);
                        else
                            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 4241);
                        end
                    else
                        player:messageText(target, NOT_HAVE_ENOUGH_GP, false, 6);
                    end
                end
            elseif (option == 5) then
                if (rank >= 3) then
                    if (player:getCurrency("guild_goldsmithing") >= 200) then
                        if (player:getFreeSlotsCount() > 0) then
                            player:delCurrency("guild_goldsmithing", 200);
                            player:addItem(4242);
                            player:messageSpecial(ITEM_OBTAINED, 4242);
                        else
                            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 4242);
                        end
                    else
                        player:messageText(target, NOT_HAVE_ENOUGH_GP, false, 6);
                    end
                end
            elseif (option == 6) then
                if (rank >= 3) then
                    if (player:getCurrency("guild_goldsmithing") >= 200) then
                        if (player:getFreeSlotsCount() > 0) then
                            player:delCurrency("guild_goldsmithing", 200);
                            player:addItem(4243);
                            player:messageSpecial(ITEM_OBTAINED, 4243);
                        else
                            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 4243);
                        end
                    else
                        player:messageText(target, NOT_HAVE_ENOUGH_GP, false, 6);
                    end
                end
            elseif (option == 7) then
                if (rank >= 3) then
                    if (player:getCurrency("guild_goldsmithing") >= 500) then
                        if (player:getFreeSlotsCount() > 0) then
                            player:delCurrency("guild_goldsmithing", 500);
                            player:addItem(4244);
                            player:messageSpecial(ITEM_OBTAINED, 4244);
                        else
                            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 4244);
                        end
                    else
                        player:messageText(target, NOT_HAVE_ENOUGH_GP, false, 6);
                    end
                end
            elseif (option == 8) then
                if (rank >= 3) then
                    if (player:getCurrency("guild_goldsmithing") >= 500) then
                        if (player:getFreeSlotsCount() > 0) then
                            player:delCurrency("guild_goldsmithing", 500);
                            player:addItem(4245);
                            player:messageSpecial(ITEM_OBTAINED, 4245);
                        else
                            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 4245);
                        end
                    else
                        player:messageText(target, NOT_HAVE_ENOUGH_GP, false, 6);
                    end
                end
            end
        end
    elseif(csid == 0x155) then
        player:messageSpecial(GP_OBTAINED, option);
    end
end;

