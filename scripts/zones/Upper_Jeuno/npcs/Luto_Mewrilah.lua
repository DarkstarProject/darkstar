-----------------------------------
-- Area: Upper Jeuno
-- !pos: -55.378 -0.300 44.873 244
-----------------------------------
package.loaded["scripts/zones/Upper_Jeuno/TextIDs"] = nil
-----------------------------------
require("scripts/zones/Upper_Jeuno/TextIDs")
require("scripts/globals/npc_util")
require("scripts/globals/quests")
require("scripts/globals/pets")
-----------------------------------

function onTrade(player,npc,trade)
end

function onTrigger(player,npc)
    local WildcatJeuno = player:getVar("WildcatJeuno")
    local FellowQuest = player:getVar("[Quest]Unlisted_Qualities")
    if player:getQuestStatus(JEUNO,LURE_OF_THE_WILDCAT_JEUNO) == QUEST_ACCEPTED and player:getMaskBit(WildcatJeuno,7) == false then
        player:startEvent(10085)
    elseif player:getQuestStatus(JEUNO,UNLISTED_QUALITIES) == QUEST_AVAILABLE then  -- Rank 4 no longer required
        player:startEvent(10031)
    elseif player:getQuestStatus(JEUNO,UNLISTED_QUALITIES) == QUEST_ACCEPTED and FellowQuest < 15 then
        player:startEvent(10033)
    elseif player:getQuestStatus(JEUNO,UNLISTED_QUALITIES) == QUEST_ACCEPTED and FellowQuest == 15 then
        player:startEvent(10032)
    end
end

-- 0x272f  0x2730  0x2731  10034  0x2737  0x2739  0x273c  0x273a  0x2740  0x273d  0x273f  0x2757  0x2745  0x2741
-- 0x2742  0x2743  0x2754  0x2755  0x2756  0x275c  0x275d  0x2744  0x273b  0x273e  0x2747  0x2748  0x2749  0x274a
-- 0x274c  0x274b  0x274d  0x274e  0x274f  0x2750  0x2753  0x2751  0x2752  0x2758  0x2759  0x275a  0x275b  0x275e
-- 0x275f  0x2760  0x2761  0x2762  0x2765  0x27be  0x27bf

function onEventUpdate(player,csid,option)
end

function onEventFinish(player,csid,option)
    if csid == 10085 then
        player:setMaskBit(player:getVar("WildcatJeuno"),"WildcatJeuno",7,true)
    elseif csid == 10031 then
        player:addQuest(JEUNO,UNLISTED_QUALITIES)
        player:setFellowNameId(option)
--[[
Adventuring Fellow Name Options:
    Male Hume:
        0   Feliz
        1   Ferdinand
        2   Gunnar
        3   Massimo
        4   Oldrich
        5   Siegward
        6   Theobald
        7   Zenji
    Female Hume:
        16  Amerita
        17  Beatrice
        18  Henrietta
        19  Jesimae
        20  Karyn
        21  Nanako
        22  Sharlene
        23  Sieghilde
    Male Elvaan:
        32  Chanandit
        33  Deulmaeux
        34  Demresinaux
        35  Ephealgaux
        36  Gauldeval
        37  Grauffemart
        38  Migaifongut
        39  Romidiant
    Female Elvaan:
        48  Armittie
        49  Cadepure
        50  Clearite
        51  Epilleve
        52  Liabelle
        53  Nauthima
        54  Radille
        55  Vimechue
    Male Taru:
        64  Balu-Falu
        65  Burg-Ladarg
        66  Ehgo-Ryuhgo
        67  Kolui-Pelui
        68  Nokum-Akkum
        69  Savul-Kivul
        70  Vinja-Kanja
        71  Yarga-Umiga
    Female Taru:
        80  Cupapa
        81  Jajuju
        82  Kalokoko
        83  Mahoyaya
        84  Pakurara
        85  Ripokeke
        86  Yawawa
        87  Yufafa
    Mithra:
        96  Fhig Lahrv
        97  Khuma Tagyawhan
        98  Pimy Kettihl
        99  Raka Maimhov
        100 Sahyu Banjyao
        101 Sufhi Uchnouma
        102 Tsuim Nhomango
        103 Yoli Kohlpaka
    Galka:
        112 Durib
        113 Dzapiwa
        114 Jugowa
        115 Mugido
        116 Voldai
        117 Wagwei
        118 Zayag
        119 Zoldof
--]]
    elseif csid == 10032 then
        if npcUtil.giveItem(player, 744) then
            player:completeQuest(JEUNO,UNLISTED_QUALITIES)
            player:setVar("[Quest]Unlisted_Qualities",0)
        end
    end
end