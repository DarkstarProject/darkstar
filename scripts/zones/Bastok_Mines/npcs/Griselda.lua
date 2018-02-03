-----------------------------------
-- Area: Bastok Mines
--  NPC: Griselda
-- Standard Merchant NPC
-- !pos -25.749 -0.044 52.360 234
-----------------------------------
package.loaded["scripts/zones/Bastok_Mines/TextIDs"] = nil;
-----------------------------------
require("scripts/globals/shop");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Mines/TextIDs");
-----------------------------------

function onTrade(player,npc,trade)
end;

function onTrigger(player,npc)

    local WildcatBastok = player:getVar("WildcatBastok");

    if (player:getQuestStatus(BASTOK,LURE_OF_THE_WILDCAT_BASTOK) == QUEST_ACCEPTED and player:getMaskBit(WildcatBastok,15) == false) then
        player:startEvent(507);
    else

        player:showText(npc,GRISELDA_SHOP_DIALOG);

        local stock =
        {
            0x115A,   360,1,     --Bottle of pineapple juice

            0x1127,    21,2,     --Bretzel
            0x118A,   432,2,     --Pickled herring
            0x1148,   990,2,     --Bottle of melon juice

            0x1193,    90,3,     --Loaf of iron bread
            0x1118,   108,3,     --Strip of meat jerky
            0x119D,    10,3      --Flask of distilled water
        }
        showNationShop(player, NATION_BASTOK, stock);

    end

end;

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
end;

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);

    if (csid == 507) then
        player:setMaskBit(player:getVar("WildcatBastok"),"WildcatBastok",15,true);
    end

end;
