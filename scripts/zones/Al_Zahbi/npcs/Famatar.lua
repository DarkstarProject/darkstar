-----------------------------------
-- Area: Al Zahbi
--  NPC: Famatar
-- Type: Imperial Gate Guard
-- @pos -105.538 0.999 75.456 48
-----------------------------------

require("scripts/globals/status");
require("scripts/globals/besieged");
local text = require("scripts/zones/Al_Zahbi/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local merc_rank = getMercenaryRank(player);

    if (merc_rank == 0) then
        player:startEvent(0x00DB,npc);
    else
        maps = getMapBitmask(player);
        if (getAstralCandescence() == 1) then
            maps = maps + 0x80000000;
        end

        x,y,z,w = getImperialDefenseStats();
        player:startEvent(0x00DA,player:getCurrency("imperial_standing"),maps,merc_rank,0,x,y,z,w);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x00DA and option >= 1 and option <= 2049) then
        itemid = getISPItem(option);
        player:updateEvent(0,0,0,canEquip(player,itemid));
    end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 0x00DA) then
        if (option == 0 or option == 16 or option == 32 or option == 48) then -- player chose sanction.
            if (option ~= 0) then
                player:delCurrency("imperial_standing", 100);
            end

            player:delStatusEffect(EFFECT_SIGIL);
            player:delStatusEffect(EFFECT_SANCTION);
            player:delStatusEffect(EFFECT_SIGNET);
            local duration = getSanctionDuration(player);
            local subPower = 0; -- getImperialDefenseStats()
            player:addStatusEffect(EFFECT_SANCTION,option / 16,0,duration,subPower); -- effect size 1 = regen, 2 = refresh, 3 = food.
            player:messageSpecial(text.SANCTION);

        elseif (option % 256 == 17) then -- player bought one of the maps
            id = 1862 + (option - 17) / 256;
            player:addKeyItem(id);
            player:messageSpecial(text.KEYITEM_OBTAINED,id);
            player:delCurrency("imperial_standing", 1000);
        elseif (option <= 2049) then -- player bought item
            item, price = getISPItem(option)
            if (player:getFreeSlotsCount() > 0) then
                player:delCurrency("imperial_standing", price);
                player:addItem(item);
                player:messageSpecial(text.ITEM_OBTAINED,item);
            else
                player:messageSpecial(text.ITEM_CANNOT_BE_OBTAINED,item);
            end
        end
    end
end;