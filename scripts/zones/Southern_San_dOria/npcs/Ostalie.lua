-----------------------------------
--    Area: Southern San d'Oria
--    NPC:  Ostalie
--    Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/globals/conquest");
require("scripts/zones/Southern_San_dOria/TextIDs");

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
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    
    player:showText(npc,OSTALIE_SHOP_DIALOG);

    stock = {0x1020,4445,1,    -- Ether
             0x1010,837,1,    -- Potion

             0x1037,736,2,    -- Echo Drops

             0x1034,290,3,    -- Antidote
             0x30b8,144,3,    -- Circlet
             0x31b8,118,3,    -- Cuffs
             0x1036,2387,3,    -- Eye Drops
             0x03fd,450,3,    -- Hatchet
             0x3388,382,3,    -- Leather Belt
             0x3389,2430,3,    -- Lizard Belt
             0x025D,180,3,    -- Pickaxe
             0x3138,216,3,    -- Robe
             0x3238,172,3}    -- Slops
             
    rank = getNationRank(SANDORIA);

        if (rank ~= 1) then
            table.insert(stock,0x03fe); --Thief's Tools
            table.insert(stock,3643);
            table.insert(stock,3);
        end
        if (rank == 3) then
            table.insert(stock,0x03ff); --Living Key
            table.insert(stock,5520);
            table.insert(stock,3);
        end

    showNationShop(player, SANDORIA, stock);

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
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;




