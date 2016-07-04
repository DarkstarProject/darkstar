-----------------------------------
-- Area: Rolanberry Fields
--  NPC: Saarlan
-- Legion NPC
-- @pos 242 24.395 468
-----------------------------------
package.loaded["scripts/zones/Rolanberry_Fields/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/titles");
require("scripts/zones/Rolanberry_Fields/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local TITLE = 0;
    local MAXIMUS = 0;
    local LP = player:getCurrency("legion_point");
    local MINIMUS = 0;

    if (player:hasKeyItem(LEGION_TOME_PAGE_MAXIMUS)) then
        MAXIMUS = 1;
    end
    if (player:hasKeyItem(LEGION_TOME_PAGE_MINIMUS)) then
        MINIMUS = 1;
    end

    if (player:hasTitle(SUBJUGATOR_OF_THE_LOFTY)) then
        TITLE = TITLE+1;
    end
    if (player:hasTitle(SUBJUGATOR_OF_THE_MIRED)) then
        TITLE = TITLE+2;
    end
    if (player:hasTitle(SUBJUGATOR_OF_THE_SOARING)) then
        TITLE = TITLE+4;
    end
    if (player:hasTitle(SUBJUGATOR_OF_THE_VEILED)) then
        TITLE = TITLE+8;
    end
    if (player:hasTitle(LEGENDARY_LEGIONNAIRE)) then
        TITLE = TITLE+16;
    end

    if (player:getVar("LegionStatus") == 0) then
        player:startEvent(8004);
    elseif (player:getVar("LegionStatus") == 1) then
        player:startEvent(8005, 0, TITLE, MAXIMUS, LP, MINIMUS);
    end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
    -- printf("CSID: %u", csid);
    -- printf("RESULT: %u", option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u", csid);
    -- printf("RESULT: %u", option);
    local GIL = player:getGil();
    local LP = player:getCurrency("legion_point");
    local LP_COST = 0;
    local ITEM = 0;

    if (csid == 8004) then
        player:setVar("LegionStatus",1)
    elseif (csid == 8005) then
        if (option == 0x0001000A) then
            if (GIL >= 360000) then
                player:addKeyItem(LEGION_TOME_PAGE_MAXIMUS);
                player:delGil(360000);
                player:messageSpecial(KEYITEM_OBTAINED, LEGION_TOME_PAGE_MAXIMUS)
            else
                player:messageSpecial(NOT_ENOUGH_GIL);
            end
        elseif (option == 0x0001000B) then
            if (GIL >= 180000) then
                player:addKeyItem(LEGION_TOME_PAGE_MINIMUS);
                player:delGil(180000);
                player:messageSpecial(KEYITEM_OBTAINED, LEGION_TOME_PAGE_MINIMUS)
            else
                player:messageSpecial(NOT_ENOUGH_GIL);
            end
        elseif (option == 0x00000002) then -- Gaiardas Ring
            LP_COST = 1000;
            ITEM = 10775
        elseif (option == 0x00010002) then -- Gaubious Ring
            LP_COST = 1000;
            ITEM = 10776;
        elseif (option == 0x00020002) then -- Caloussu Ring
            LP_COST = 1000;
            ITEM = 10777;
        elseif (option == 0x00030002) then -- Nanger Ring
            LP_COST = 1000;
            ITEM = 10778;
        elseif (option == 0x00040002) then -- Sophia Ring
            LP_COST = 1000;
            ITEM = 10779;
        elseif (option == 0x00050002) then -- Quies Ring
            LP_COST = 1000;
            ITEM = 10780;
        elseif (option == 0x00060002) then -- Cynosure Ring
            LP_COST = 1000;
            ITEM = 10781;
        elseif (option == 0x00070002) then -- Ambuscade Ring
            LP_COST = 1000;
            ITEM = 10782;
        elseif (option == 0x00080002) then -- Veneficium Ring
            LP_COST = 1000;
            ITEM = 10783;
        elseif (option == 0x00090002) then -- Calma Armet  ...Requires title: "Subjugator of the Lofty"
            LP_COST = 4500;
            ITEM = 10890;
        elseif (option == 0x000A0002) then -- Mustela Mask  ...Requires title: "Subjugator of the Lofty"
            LP_COST = 4500;
            ITEM = 10891;
        elseif (option == 0x000B0002) then -- Magavan Beret  ...Requires title: "Subjugator of the Lofty"
            LP_COST = 4500;
            ITEM = 10892;
        elseif (option == 0x000C0002) then -- Calma Gauntlets  ...Requires title: "Subjugator of the Mired"
            LP_COST = 3000;
            ITEM = 10512;
        elseif (option == 0x000D0002) then -- Mustela Gloves  ...Requires title: "Subjugator of the Mired"
            LP_COST = 3000;
            ITEM = 10513;
        elseif (option == 0x000E0002) then -- Magavan Mitts  ...Requires title: "Subjugator of the Mired"
            LP_COST = 3000;
            ITEM = 10514;
        elseif (option == 0x000F0002) then -- Calma Hose  ...Requires title: "Subjugator of the Soaring"
            LP_COST = 4500;
            ITEM = 11980;
        elseif (option == 0x00100002) then -- Mustela Brais  ...Requires title: "Subjugator of the Soaring"
            LP_COST = 4500;
            ITEM = 11981;
        elseif (option == 0x00110002) then -- Magavan Slops  ...Requires title: "Subjugator of the Soaring"
            LP_COST = 4500;
            ITEM = 11982;
        elseif (option == 0x00120002) then -- Calma Leggings  ...Requires title: "Subjugator of the Veiled"
            LP_COST = 3000;
            ITEM = 10610;
        elseif (option == 0x00130002) then -- Mustela Boots  ...Requires title: "Subjugator of the Veiled"
            LP_COST = 3000;
            ITEM = 10611;
        elseif (option == 0x00140002) then -- Magavan Clogs  ...Requires title: "Subjugator of the Veiled"
            LP_COST = 3000;
            ITEM = 10612;
        elseif (option == 0x00150002) then -- Calma Breastplate  ...Requires title: "Legendary Legionnaire"
            LP_COST = 10000;
            ITEM = 10462;
        elseif (option == 0x00160002) then -- Mustela Harness  ...Requires title: "Legendary Legionnaire"
            LP_COST = 10000;
            ITEM = 10463;
        elseif (option == 0x00170002) then -- Magavan Frock  ...Requires title: "Legendary Legionnaire"
            LP_COST = 10000;
            ITEM = 10464;
        elseif (option == 0x00180002) then -- Corybant Pearl  ...Requires title: "Subjugator of the Lofty"
            LP_COST = 3000;
            ITEM = 11044;
        elseif (option == 0x00190002) then -- Saviesa Pearl  ...Requires title: "Subjugator of the Mired"
            LP_COST = 3000;
            ITEM = 11045;
        elseif (option == 0x001A0002) then -- Ouesk Pearl  ...Requires title: "Subjugator of the Soaring"
            LP_COST = 3000;
            ITEM = 11046;
        elseif (option == 0x001B0002) then -- Belatz Pearl  ...Requires title: "Subjugator of the Soaring"
            LP_COST = 3000;
            ITEM = 11047;
        elseif (option == 0x001C0002) then -- Cytherea Pearl  ...Requires title: "Subjugator of the Veiled"
            LP_COST = 3000;
            ITEM = 11048;
        elseif (option == 0x001D0002) then -- Myrddin Pearl  ...Requires title: "Subjugator of the Veiled"
            LP_COST = 3000;
            ITEM = 11049;
        elseif (option == 0x001E0002) then -- Puissant Pearl  ...Requires title: "Subjugator of the Veiled"
            LP_COST = 3000;
            ITEM = 11050;
        elseif (option == 0x001F0002) then -- Dhanurveda Ring  ...Requires title: "Legendary Legionnaire"
            LP_COST = 6000;
            ITEM = 10784;
        elseif (option == 0000200002) then -- Provocare Ring  ......Requires title: "Legendary Legionnaire"
            LP_COST = 6000;
            ITEM = 10785;
        elseif (option == 0000210002) then -- Mediator's Ring  ...Requires title: "Legendary Legionnaire"
            LP_COST = 6000;
            ITEM = 10786;
        end
    end

    if (LP < LP_COST) then
        player:messageSpecial(LACK_LEGION_POINTS);
    elseif (ITEM > 0) then
        if (player:getFreeSlotsCount() >=1) then
            player:delCurrency("legion_point", LP_COST);
            player:addItem(ITEM, 1);
            player:messageSpecial(ITEM_OBTAINED, ITEM);
        else
            player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, ITEM);
        end
    end

end;