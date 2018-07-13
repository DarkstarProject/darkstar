-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Ostalie
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/globals/conquest");
require("scripts/zones/Southern_San_dOria/TextIDs");
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

    player:showText(npc,OSTALIE_SHOP_DIALOG);

    local stock = {4128,4445,1,    -- Ether
             4112,837,1,    -- Potion

             4151,736,2,    -- Echo Drops

             4148,290,3,    -- Antidote
             12472,144,3,    -- Circlet
             12728,118,3,    -- Cuffs
             4150,2387,3,    -- Eye Drops
             1021,450,3,    -- Hatchet
             13192,382,3,    -- Leather Belt
             13193,2430,3,    -- Lizard Belt
             605,180,3,    -- Pickaxe
             12600,216,3,    -- Robe
             12856,172,3}    -- Slops

    rank = getNationRank(dsp.nation.SANDORIA);

        if (rank ~= 1) then
            table.insert(stock,1022); --Thief's Tools
            table.insert(stock,3643);
            table.insert(stock,3);
        end
        if (rank == 3) then
            table.insert(stock,1023); --Living Key
            table.insert(stock,5520);
            table.insert(stock,3);
        end

    dsp.shop.nation(player, stock, dsp.nation.SANDORIA);

end;

function onEventUpdate(player,csid,option)
end;

function onEventFinish(player,csid,option)
end;
