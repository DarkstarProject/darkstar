-----------------------------------
-- Area: Southern San d'Oria
--  NPC: Miogique
-- Standard Merchant NPC
-----------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/settings");
require("scripts/globals/shop");
require("scripts/globals/quests");
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

    player:showText(npc,MIOGIQUE_SHOP_DIALOG);

    local stock = {0x3108,14256,1,    -- Chainmail
             0x3188,7783,1,        -- Chain Mittens
             0x3180,23846,1,    -- Gauntlets
             0x3088,9439,1,        -- Iron Mask

             0x309a,13179,2,    -- Studded Bandana
             0x319a,11012,2,    -- Studded Gloves
             0x311a,20976,2,    -- Studded Vest

             0x30a1,1504,3,        -- Brass Cap
             0x3121,2286,3,        -- Brass Harness
             0x31a1,1255,3,        -- Brass Mittens
             0x30a0,154,3,        -- Bronze Cap
             0x3120,576,3,        -- Bronze Harness
             0x31a0,128,3,        -- Bronze Mittens
             0x3098,396,3,        -- Leather Bandana
             0x3198,331,3,        -- Leather Gloves
             0x3118,618,3}        -- Leather Vest

    showNationShop(player, NATION_SANDORIA, stock);

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;
