-----------------------------------
-- Area: Pashhow Marshlands [S]
--  NPC: Indescript Markings
-- NOTE: There are 3 Indescript Markings
-----------------------------------
package.loaded["scripts/zones/Pashhow_Marshlands_[S]/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Pashhow_Marshlands_[S]/TextIDs");
require("scripts/globals/keyitems");
require("scripts/globals/teleports");
require("scripts/globals/campaign");
require("scripts/globals/npc_util");
require("scripts/globals/quests");

-----------------------------------

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

    local pantsQuestProgress   = player:getVar("AF_SCH_PANTS");
    local gownQuestProgress    = player:getVar("AF_SCH_BODY");
    local onSabbatical         = player:getQuestStatus(CRYSTAL_WAR,ON_SABBATICAL);
    local onSabbaticalProgress = player:getVar("OnSabbatical");
    local markings             = 17146626; -- Base ID for the 3 markings

    if (onSabbatical == QUEST_ACCEPTED and npc:getID() == markings) then
        if (onSabbaticalProgress == 2) then
            player:startEvent(2);
        end


    -- SCH AF Quest - Pants - Using the second NPC in the list of markings from POLUtils
    elseif (pantsQuestProgress > 0 and pantsQuestProgress < 3 and player:hasKeyItem(SLUG_MUCUS) == false and npc:getID() == markings + 1) then

        player:addKeyItem(SLUG_MUCUS);
        player:messageSpecial(KEYITEM_OBTAINED, SLUG_MUCUS);
        player:setVar("AF_SCH_PANTS", pantsQuestProgress + 1);

        -- Move the markings around
        local position = {
            [1] = {508,  22, 586}, -- K-5 N
            [2] = {543,  22, 478}, -- K-5 SE
            [3] = {484,  24, 502}, -- K-5
            [4] = {371,  24, 420}, -- J-6
            [5] = {226,  25, 316}, -- I-6
            [6] = {92,   24, 140}, -- I-7
            [7] = {-226, 25, 428}, -- G-6 NW
            [8] = {-135, 24, 374}  -- G-6 E
        }

        -- Pick a new pos that isn't the current
        local newPosition = npcUtil.pickNewPosition(npc:getID(), positions);

        npc:hideNPC(900); -- Hide for 15 minutes
        npc:setPos(newPosition.x, newPosition.y, newPosition.z);
        -- player:PrintToPlayer("Markings moved to position index " .. newPosition);


    -- AF SCH Quest - Body - Using the second NPC in the list of markings from POLUtils
    elseif (gownQuestProgress > 0 and gownQuestProgress < 3 and player:hasKeyItem(PEISTE_DUNG) == false and npc:getID() == markings + 2) then

        player:addKeyItem(PEISTE_DUNG);
        player:messageSpecial(KEYITEM_OBTAINED, PEISTE_DUNG);
        player:setVar("AF_SCH_BODY", gownQuestProgress + 1);

        -- Move the markings around
        local positions = {
            [1] = {404,  24,  53},  -- (K-8)
            [2] = {421,  24, -101}, -- (K-9)  South of Cavernous Maw
            [3] = {380,  25, -116}, -- (J-9)  Just east of the Telepoint.
            [4] = {411,  25, -292}, -- (K-10)
            [5] = {353,  25, -218}, -- (J-10) Just South from the Veridical Conflux.
            [6] = {245,  25, -258}, -- (I-10) On the border between I and J, just south of the road.
            [7] = {-76,  25, -203}, -- (H-10) NW corner, just south of the road.
            [8] = {32,   25, -238}, -- (H-10) North of road. Between road and wall edge.
            [9] = {59,   25, -326}  -- (H-10) SE corner, just South of the Road.
        }

        -- Pick a new pos that isn't the current
        local newPosition = npcUtil.pickNewPosition(npc:getID(), positions);

        npc:setPos(newPosition.x, newPosition.y, newPosition.z);
        -- player:PrintToPlayer("Markings moved to position index " .. newPosition);
    else        
        player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
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
-- onEventFinish Action
-----------------------------------

function onEventFinish(player,csid,option)
    -- printf("CSID: %u",csid);
    -- printf("RESULT: %u",option);
    if (csid == 2) then
        player:addKeyItem(SCHULTS_SEALED_LETTER);
        player:messageSpecial(KEYITEM_OBTAINED, SCHULTS_SEALED_LETTER);
        player:setVar("OnSabbatical", 3);
    end
end;
