-----------------------------------
--  Area: Windurst Woods
--  NPC:  Ibwam
--  Type: Warp NPC
--  @pos -25.655 1.749 -60.651 241
-----------------------------------
package.loaded["scripts/zones/Windurst_Woods/TextIDs"] = nil;
package.loaded["scripts/globals/settings"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/globals/missions");
require("scripts/globals/teleports");
require("scripts/globals/keyitems");
require("scripts/zones/Windurst_Woods/TextIDs");

--[[
Bitmask Designations:
Windurst Woods (Working in a circuit from Ibwam)
00001    (H-10) Soni-Muni (Bomingo Round, walking the rim of the fountain) 
00002    (J-13) Etsa Rhuyuli (atop the Auction House) 
00004    (I-10) Cayu Pensharhumi (at the arch in the corridor west of Leviathan's Gate) 
00008    (I-5) Umumu (Mithra Groves, at the arch next to the dhalmels.) 
00010    (J-3) Nanaa Mihgo (Mithra Groves. North-most cluster) 

Windurst Walls (Counter-clockwise)
00020    (J-11) Yoriri (on top of the Auction House) 
00040    (K-7) Shantotto (in Shantotto's Manor) 
00080    (J-6) Moan-Maon (just west of the Consulate of Jeuno, at the pathway that leads to it) 
00100    (H-3) Chomomo (on the East side behind the House of the Hero, go on the path leading North from Gerun-Garun) 
00200    (F-5) Naih Arihmepp (wanders along the path by Yoran-Oran's Manor) 

Windurst Waters (All NPCs are in North Waters) (North to South)
00400    (G-4) Npopo (right by the gate to Sarutabaruta) 
00800    (F-8) Lago-Charago (on top of the Optistery) 
01000    (G-9) Amagusa-Chigurusa (South-east part of Huntsman's Court area, top left corner of G-9) 
02000    (F-9) Funpo-Shipo (walks along the path outside Timbre Timbers Tavern, on the north side) 
04000    (F-10) Kyume-Romeh (bottom floor of Timbre Timber Tavern) 

Port Windurst (West to East)
08000    (E-7) Kunchichi (a magic-caster inside the Orastery) 
10000    (E-7) Yaman-Hachuman (inside the Orastery, east wall) 
20000    (F-6) Choyi Totlihpa (southeast of Consulate of Bastok, entrance of the pathway tunnel) 
40000    (G-7) Three of Clubs (standing guard leading to the dock/pier with the Magic/Weapon-Armor shops) 
80000    (M-6) Yujuju (outside the Air Travel Agency) 
]]--

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
    if (trade:getGil() == 300 and trade:getItemCount() == 1 and player:getQuestStatus(WINDURST,LURE_OF_THE_WILDCAT_WINDURST) == QUEST_COMPLETED and player:getCurrentMission(TOAU) > IMMORTAL_SENTRIES) then 
        -- Needs a check for at least traded an invitation card to Naja Salaheem
        player:startEvent(0x031a);
    end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
    local LureWindurst = player:getQuestStatus(WINDURST,LURE_OF_THE_WILDCAT_WINDURST);
    local WildcatWindurst = player:getVar("WildcatWindurst");
    if (LureWindurst ~= QUEST_COMPLETED and ENABLE_TOAU == 1) then
        if (LureWindurst == QUEST_AVAILABLE) then
            player:startEvent(0x02e0);
        else
            if (WildcatWindurst == 0) then
                player:startEvent(0x02e1);
            elseif (player:isMaskFull(WildcatWindurst,20) == true) then
                player:startEvent(0x02e3);
            else
                player:startEvent(0x02e2);
            end
        end
    elseif (player:getCurrentMission(TOAU) >= 2) then
        player:startEvent(0x0319);
    else
        player:startEvent(0x02e4);
    end
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

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
    if (csid == 0x02e0) then
        player:addQuest(WINDURST,LURE_OF_THE_WILDCAT_WINDURST);
        player:setVar("WildcatWindurst",0);
        player:addKeyItem(GREEN_SENTINEL_BADGE);
        player:messageSpecial(KEYITEM_OBTAINED,GREEN_SENTINEL_BADGE);
    elseif (csid == 0x02e3) then
        player:completeQuest(WINDURST,LURE_OF_THE_WILDCAT_WINDURST);
        player:addFame(WINDURST,150);
        player:setVar("WildcatWindurst",0);
        player:delKeyItem(GREEN_SENTINEL_BADGE);
        player:addKeyItem(GREEN_INVITATION_CARD);
        player:messageSpecial(KEYITEM_LOST,GREEN_SENTINEL_BADGE);
        player:messageSpecial(KEYITEM_OBTAINED,GREEN_INVITATION_CARD);
    elseif (csid == 0x031a) then
        player:tradeComplete();
        toAhtUrhganWhitegate(player);
    end
end;